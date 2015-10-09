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
=======
An open-source crypto currency exchange
=====================================

**I'LL BE BACK**

[![Code Climate](https://codeclimate.com/github/peatio/peatio.png)](https://codeclimate.com/github/peatio/peatio)
[![Build Status](https://travis-ci.org/peatio/peatio.png?branch=master)](https://travis-ci.org/peatio/peatio)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/peatio/peatio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Peatio is a free and open-source crypto currency exchange implementation with the Rails framework and other cutting-edge technology.


### Mission

Our mission is to build the world best open-source crypto currency exchange with a high performance trading engine and safety which can be trusted and enjoyed by users. Additionally we want to move the crypto currency exchange technology forward by providing support and add new features. We are helping people to build easy their own exchange around the world.

Help is greatly appreciated, feel free to submit pull-requests or open issues.


### Things You Should Know ###

RUNNING A EXCHANGE IS HARD.

Peatio makes it easier, but running an exchange is still harder than a blog, which you can download the source code and following the guide or even a cool installer and boom!!! a fancy site is there to profit. We always prioritize security and speed higher than 1-click setup. We split Peatio to many components (processes) so it's flexible to deploy and scalable.

SECURITY KNOWLEDGE IS A REQUIREMENT.

Peatio cannot protect your customers when you leave your admin password 1234567, or open sensitive ports to public internet. No one can. Running an exchange is a very risky task because you're dealing with money directly. If you don't known how to make your exchange secure, hire an expert.

You must know what you're doing, there's no shortcut. Please get prepared before continue:

* Rails knowledge
* Security knowledge
* System administration


### Features

* Designed as high performance crypto currency exchange.
* Built-in high performance matching-engine.
* Built-in [Proof of Solvency](https://iwilcox.me.uk/2014/proving-bitcoin-reserves) Audit.
* Built-in ticket system for customer support.
* Usability and scalibility.
* Websocket API and high frequency trading support.
* Support multiple digital currencies (eg. Bitcoin, Litecoin, Dogecoin etc.).
* Easy customization of payment processing for both fiat and digital currencies.
* SMS and Google Two-Factor authenticaton.
* [KYC Verification](http://en.wikipedia.org/wiki/Know_your_customer).
* Powerful admin dashboard and management tools.
* Highly configurable and extendable.
* Industry standard security out of box.
* Active community behind.
* Free and open-source.
* Created and maintained by [Peatio open-source group](http://peat.io).


### Known Exchanges using Peatio

* [Yunbi Exchange](https://yunbi.com) - A crypto-currency exchange funded by BitFundPE
* [One World Coin](https://oneworldcoin.com)
* [Bitspark](https://bitspark.io) - Bitcoin Exchange in Hong Kong
* [MarsX.io](https://acx.io) - Australian Cryptocurrency Exchange

### Mobile Apps ###

* [Boilr](https://github.com/andrefbsantos/boilr) - Cryptocurrency and bullion price alarms for Android

### Requirements

* Linux / Mac OSX
* Ruby 2.1.0
* Rails 4.0+
* Git 1.7.10+
* Redis 2.0+
* MySQL
* RabbitMQ

** More details are in the [doc](doc).


### Getting started

* [Setup on Mac OS X](doc/setup-osx.md)
* [Setup on Ubuntu](doc/setup-ubuntu.md)
* [Deploy production server](doc/deploy-ubuntu.md)

### API

You can interact with Peatio through API:

* [API v2](http://demo.peat.io/documents/api_v2?lang=en)
* [Websocket API](http://demo.peat.io/documents/websocket_api)

Here're some API clients and/or wrappers:

* [peatio-client-ruby](https://github.com/peatio/peatio-client-ruby) is the official ruby client of both HTTP/Websocket API.
* [peatio-client-python by JohnnyZhao](https://github.com/JohnnyZhao/peatio-client-python) is a python client written by JohnnyZhao.
* [peatio-client-python by czheo](https://github.com/JohnnyZhao/peatio-client-python) is a python wrapper similar to peatio-client-ruby written by czheo.
* [peatioJavaClient](https://github.com/classic1999/peatioJavaClient.git) is a java client written by classic1999.
* [yunbi-client-php](https://github.com/panlilu/yunbi-client-php) is a php client written by panlilu.

### Custom Style

Peatio front-end based Bootstrap 3.0 version and Sass, and you can custom exchange style for your mind.

* change bootstrap default variables in `vars/_bootstrap.css.scss`
* change peatio custom default variables in `vars/_basic.css.scss`
* add your custom variables in `vars/_custom.css.scss`
* add your custom css style in `layouts/_custom.css.scss`
* add or change features style in `features/_xyz.css.scss'

`vars/_custom.css.scss` can overwrite `vars/_basic.css.scss` defined variables
`layout/_custom.css.scss` can overwrite `layout/_basic.css.scss` and `layoputs/_header.css.scss` style

### Getting Involved

Want to report a bug, request a feature, contribute or translate Peatio?

* Browse our [issues](https://github.com/peatio/peatio/issues), comment on proposals, report bugs.
* Clone the peatio repo, make some changes according to our development guidelines and issue a pull-request with your changes.
* Anything you want to tell us please send it to [community@peatio.com](mailto:community@peatio.com)
* If you need technical support or customization service, contact us: [sales@peatio.com](mailto:sales@peatio.com)


### License

Peatio is released under the terms of the MIT license. See [http://peatio.mit-license.org](http://peatio.mit-license.org) for more information.


### DONATE

**Every satoshi of your kind donation goes into the ongoing work of making Peatio more awesome.**

**peatio-opensource-donate** address [1HjfnJpQmANtuW7yr1ggeDfyfe1kDK7rm3](https://blockchain.info/address/1HjfnJpQmANtuW7yr1ggeDfyfe1kDK7rm3)


### What is Peatio?

[Peatio](http://en.wikipedia.org/wiki/Pixiu) (Chinese: 貔貅) is a Chinese mythical hybrid creature considered to be a very powerful protector to practitioners of Feng Shui.

**[This illustration copyright for Peatio Team]**

![logo](public/peatio.png)

