云币在ubuntu下的安装参考： https://github.com/peatio/peatio/blob/master/doc/setup-local-ubuntu.md

bitcoin网络： https://en.bitcoin.it/wiki/Bitcoind

了解比特币测试网络？
怎么生成钱包？
怎么给钱包增加比特币
比特币协议变更方式
云币的操作模式
云币的总账户拥有或购买一定数量的比特币，进行交易的前提
用户有两种充值方式，充值人民币到平台制定的银行账户，从自己的有比特币地址的账户充值到平台比特币地址（这个未确认？）
用户购入或卖出比特币，云币平台只记录交易信息，并改变账户或比特币账户的余额
用户提现操作，人民币提现，直接提现到自己的银行账户里面，比特币提现，提供自己的地址，然后交一定的手续费就可以从云币平台提取比特币，这时候交易就确认了吗？fix
云币的职责，促成交易？保证公平，为市场提供比特币
云币
云币上的注册
注册及验证
两段验证
云币的上会员对应members表，每个member表对应一个账户accounts表
云币网的特征
Features

Designed as high performance crypto currency exchange.
被设计用来高性能货币交换
Built-in high performance matching-engine.
内建高性能匹配引擎
Built-in Proof of Solvency Audit.

Built-in ticket system for customer support.
在客户支持方面内建票务系统
Usability and scalibility.
可用性和可扩展性
Websocket API and high frequency trading support.
Websocket API和高频交易支持
Support multiple digital currencies (eg. Bitcoin, Litecoin, Dogecoin etc.).
支持多个电子货币（如：Bitcoin, 莱特币，Dogecoin 等)
Easy customization of payment processing for both fiat and digital currencies.
? 易定制支付处理对于新发布电子货币？（不懂）
SMS and Google Two-Factor authenticaton.
短信和谷歌两段验证（授权）
KYC Verification.

Powerful admin dashboard and management tools.
强大的管理面板和管理工具
Highly configurable and extendable.
高可配、高扩展
Industry standard security out of box.
工业安全标准
Active community behind.
活跃社区
Free and open-source.
开源
Created and maintained by Peatio open-source group.
由Peatio开源团队创建和维护


RabbitMQ介绍： http://baike.baidu.com/view/4095865.htm


用户买入（ask）或卖出（bid）比特币的程序流程为：
user buy or bid from web or api ->  # 用户通过浏览器或API提交
Private::OrderBidsController.create 或者 Private::OrderAsksController.create -> # 创建买入或卖出order
Concerns::OrderCreation.order_submit -> # 提交订单
Ordering::submit -> # 提交订单
Ordering::do_submit -> # 提交订单到数据库(order)，锁定相应的金额(amount*volume)
AMQPQueue.enqueue -> # 将每个订单进入队列 队列的定义： app/models/amqp_queue.rb

队列就放到了RabbitMQ服务器中
# lib/daemons/matching_ctl 守护进程注册了matching服务
daemon会启动相应的服务worker，文件位于 app/models/worker/matching.rb

RabbitMQ会将消息发送给订阅了matching的customer
Worker::Matching.process -> # 根据类型，如submit来调用不同的服务
Worker::Matching::OrderBookManager.build_order ->
Worker::Matching.submit ->
Matching::Engine.submit ->
Matching::Engine.match -> # 反复match
每匹配成功一次，发送一条消息trade_executor

Worker::TradeExecutor.process ->
Matching::Executor.execute! ->


AMQPQueue

怎么确保交易公平？
就是按价格，然后顺序排就可以，锁表的形式并发能达到多大呢？


RabbitMQ中的消费者，生产者



不通过挖矿产生比特币，开始怎么生成比特币的所有者？

还是靠传统信用？

术语：
地址：
钱包：
Tx：
order book: 订货单
limit order: 限价委托
market order: 市场价委托
price level: 物价水平
strike price: 履约价格
2015-9-28
==============================
# 关于daemons的启动，如果非正常关机，由于pid是存在于文件中的，再次启动daemon服务时，会读取该文件，如果文件的pid存在，但是不会去验证该服务是否还在，导致无法启动，这时候要么删除掉所有的以pid结尾的文件
# limit订单和market订单的区别？
一个是限价委托，一个是市场委托
类似股票中的价格，当前的价格为市场价格
# limit订单中的price是什么价格？

2015-9-29
==============================
# 添加或取消或成交操作是哪个来实现通知到所有正在交易的人员？
# 如果是买入，就和卖出的所有比较，卖出则相反，因为之前的交易肯定以达到平衡了
# RabbitMQ消息服务器用来限制执行的顺序，如果一笔交易正在执行时，应该不会在从消息队列里面取消息了