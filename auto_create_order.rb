require 'peatio_client'
require 'active_record'
require 'mysql2'
require 'active_support/core_ext/numeric'
require 'pry'

# 建立到数据库的连接
ActiveRecord::Base.establish_connection(
	adapter:  "mysql2",
	host:     "127.0.0.1",
	username: "root",
	password: "lixiumiao",
	database: "peatio_development",
	encoding: 'utf8',
	reconnect: true
)
# 创建用户ApiToken model
class ApiToken < ActiveRecord::Base
	belongs_to :member
end
class Member < ActiveRecord::Base
	has_many :api_tokens
end


# 获取卖家
seller_api_tokens = Member.where(['email like ?', '%ask.com'])
# 获取买家
buyer_api_tokens = Member.where(['email like ?', '%bid.com'])

def create_client

	PeatioAPI::Client.new access_key: '3pBSw9yXOocDEaSsr5q78oK7k7dPrQxqrFszfbpq', secret_key: '13KUuefVsMxs6riLZZiFansrWjw61jOxIP4xJKE3', endpoint: 'http://127.0.0.1:3000', timeout: 60
end



client_public = PeatioAPI::Client.new endpoint: 'http://127.0.0.1'

# GET public api /api/v2/markets
# client_public.get_public '/api/v2/markets'
client1 = 	PeatioAPI::Client.new access_key: 'hInVroSJXK0shc9t96H7Ub16YK0G3ccjOBlcgXAG', secret_key: 'xIhaOxzLUMyD57b1xqpbZmXFODsU5gc9CRyrHmxa', endpoint: 'http://127.0.0.1:3000', timeout: 60

client2 = PeatioAPI::StreamingClient.new access_key: 'kwW8dycJPwEUDwafaIBcx3f3tNnMN8YnKM9YkAWW', secret_key: 't6ESANqvALxVxLvO6vjoxCeYGDSNeiKXPsOlkwEc', endpoint: 'http://127.0.0.1:3000'

# 最近一次交易价格
last = 200
# 0 -上升，1-下降
up_or_down = nil
# 连续上升次数，最多10次
up_times = 0
# 连续下降次数，最多10次
down_times = 0
# 大单时间，如果大单出现，并且离上一次有5分钟以上，才可以出现大单
big_deal_time = Time.now
loop do
	# 等待1到4秒再去下单
	sleep  rand(1..4)
	# 上一次交易价格
	ticker = client1.get '/api/v2/tickers/puercny.json', market: 'puercny'
	last = ticker['ticker']['last'].to_f
	#binding.pry
	# 大部分交易在0.1千克，价格200左右，
	# 大单控制在1千克左右，
	# 上升或下降趋势控制：随机上升或是下降：然后
	# 应该获取市场深度，如需要价格上升到某个价格，直接购买对应深度时的价格
	depth = client1.get '/api/v2/depth.json', market: 'puercny'
	# 未取出上一次的价格时
	amount_a = [0,0]
	price_a= [0,0]
	up_or_down = rand(3)
	if 5.minutes.ago > big_deal_time
		buy_amount = rand(4.5..6.2)
		big_deal_time = Time.now
	else
		buy_amount = rand(0.09..0.12)
	end
	sell_amount = rand(0.08..0.12)
	#上升时，上升幅度与上升次数成反比
	buy_price = rand(last..last*(1.1/(1+up_times).round(2)))
	#requirebinding.pry
	sell_price = rand(buy_price*0.8..buy_price*1.15).round(2)
	amount_a,price_a =  up_or_down == 0 ? [[buy_amount,sell_amount.to_f],[buy_price,sell_price.to_f]] : [[sell_amount,buy_amount.to_f],[sell_price,buy_price.to_f]]

	client1.post '/api/v2/orders', market: 'puercny', side: 'sell', volume: amount_a[0], price: price_a[0]
	client2.post '/api/v2/orders', market: 'puercny', side: 'buy', volume: amount_a[1], price:  price_a[1]
end
# POST to create multiple orders at once
#client1.post '/api/v2/orders/multi', market: 'puercny', orders: [{side: 'buy', volume: '0.15', price: '2955.0'}, {side: 'sell', volume: '0.16', price: '2956'}]
