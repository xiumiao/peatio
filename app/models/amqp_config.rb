# RabbitMQ中的几个概念
# Exchange:交换机，决定了消息路由规则；
# Queue:消息队列；
# Channel:进行消息读写的通道；
# Bind:绑定了Queue和Exchange，意即为符合什么样路由规则的消息，将会放置入哪一个消息队列；
class AMQPConfig
  class <<self
    def data
      @data ||= Hashie::Mash.new YAML.load_file(Rails.root.join('config', 'amqp.yml'))
    end

    # 获取链接
    # connect:
    #     host: 127.0.0.1
    #     port: 5672
    def connect
      data[:connect]
    end

    # 将队列id绑定到exchange, 队列如：matching
    def binding_exchange_id(id)
      data[:binding][id][:exchange]
    end

    def binding_exchange(id)
      eid = binding_exchange_id(id)
      eid && exchange(eid)
    end

    def binding_queue(id)
      queue data[:binding][id][:queue]
    end

    def binding_worker(id)
      ::Worker.const_get(id.to_s.camelize).new
    end

    def routing_key(id)
      binding_queue(id).first
    end

    def topics(id)
      data[:binding][id][:topics].split(',')
    end

    def channel(id)
      (data[:channel] && data[:channel][id]) || {}
    end

    def queue(id)
      name = data[:queue][id][:name]
      settings = { durable: data[:queue][id][:durable] }
      [name, settings]
    end

    def exchange(id)
      type = data[:exchange][id][:type]
      name = data[:exchange][id][:name]
      [type, name]
    end

  end
end
