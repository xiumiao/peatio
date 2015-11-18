#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

raise "bindings must be provided." if ARGV.size == 0

Rails.logger = logger = Logger.new STDOUT

conn = Bunny.new AMQPConfig.connect
conn.start

ch = conn.create_channel
# 例如： $0 = 'peatio:amqp:notification'
# 此时 id = notification
id = $0.split(':')[2]
# 预取个数 只有 trade_executor order_processor
prefetch = AMQPConfig.channel(id)[:prefetch] || 0
ch.prefetch(prefetch) if prefetch > 0
logger.info "Connected to AMQP broker (prefetch: #{prefetch > 0 ? prefetch : 'default'})"

terminate = proc do
  # logger is forbidden in signal handling, just use puts here
  puts "Terminating threads .."
  ch.work_pool.kill
  puts "Stopped."
end
Signal.trap("INT",  &terminate)
Signal.trap("TERM", &terminate)

workers = []
# eg. {dir_mode:, script:
# id = matching
ARGV.each do |id|
  # 找到该daemon对应的worker,每个daemon对应一个worker
  worker = AMQPConfig.binding_worker(id)
  # 返回数组 eg. [name=peatio.matching,setting={durable:true}]
  queue  = ch.queue *AMQPConfig.binding_queue(id)
  # id name eg. notification
  # 如果该id有exchange路由,返回[type,name]
  # exchange:
  #     trade:
  #     name: peatio.trade
  #     type: headers
  if args = AMQPConfig.binding_exchange(id)
    x = ch.send *args

    case args.first
    when 'direct' # 两种类型： 直接发送消息到指定队列（点对点，或广播）
      queue.bind x, routing_key: AMQPConfig.routing_key(id)
    when 'topic' # 主题, 只有匹配的队列才会获取
      AMQPConfig.topics(id).each do |topic|
        queue.bind x, routing_key: topic
      end
    else # 默认发送给所有的队列的信息
      queue.bind x
    end
  end

  clean_start = AMQPConfig.data[:binding][id][:clean_start]
  # if true 清空队列
  queue.purge if clean_start

  manual_ack  = AMQPConfig.data[:binding][id][:manual_ack]
  # delivery information, message metadata (properties) and message body (often called the payload).
  # message metadata attributes are:
  # message content encoding
  # message priority
  # message expiration time
  # message identifier
  # reply to (specifies which message this is a reply to)
  # application id (identifier of the application that produced the message)
  queue.subscribe(manual_ack: manual_ack) do |delivery_info, metadata, payload|
    logger.info "Received: #{payload}"
    begin
      worker.process JSON.parse(payload), metadata, delivery_info
    rescue Exception => e
      logger.fatal e
      logger.fatal e.backtrace.join("\n")
    ensure
      # 确认移除出队列
      ch.ack(delivery_info.delivery_tag) if manual_ack
    end
  end

  workers << worker
end

%w(USR1 USR2).each do |signal|
  Signal.trap(signal) do
    puts "#{signal} received."
    handler = "on_#{signal.downcase}"
    workers.each {|w| w.send handler if w.respond_to?(handler) }
  end
end

ch.work_pool.join
