require_relative 'constants'

module Matching
  class LimitOrder
    attr :id, :timestamp, :type, :price, :market
    attr_accessor :volume

    def initialize(attrs)
      @id         = attrs[:id]
      @timestamp  = attrs[:timestamp]
      @type       = attrs[:type].to_sym
      @volume     = attrs[:volume].to_d
      @price      = attrs[:price].to_d
      @market     = Market.find attrs[:market]

      raise InvalidOrderError.new(attrs) unless valid?(attrs)
    end

    # 交易
    def trade_with(counter_order, counter_book)
      if counter_order.is_a?(LimitOrder)
        if crossed?(counter_order.price) # ask 卖价大于等于成交价？ 否则不成交
          trade_price  = counter_order.price # 交易价格
          trade_volume = [volume, counter_order.volume].min # 交易数量以小的为主
          trade_funds  = trade_price*trade_volume # 交易金额
          [trade_price, trade_volume, trade_funds]
        end
      else
        trade_volume = [volume, counter_order.volume, counter_order.volume_limit(price)].min
        trade_funds  = price*trade_volume
        [price, trade_volume, trade_funds]
      end
    end

    def fill(trade_price, trade_volume, trade_funds)
      raise NotEnoughVolume if trade_volume > @volume
      @volume -= trade_volume
    end

    def filled?
      # volume <= ZERO 这是调用方法，下面是直接用实例变量
      @volume <= ZERO
    end

    # ask 卖价大于等于成交价？
    # bid 买价小于等于成交价？
    def crossed?(price)
      if type == :ask
        price >= @price # if people offer price higher or equal than ask limit
      else
        price <= @price # if people offer price lower or equal than bid limit
      end
    end

    def label
      "%d/$%s/%s" % [id, price.to_s('F'), volume.to_s('F')]
    end

    def valid?(attrs)
      return false unless [:ask, :bid].include?(type)
      id && timestamp && market && price > ZERO
    end

    def attributes
      { id: @id,
        timestamp: @timestamp,
        type: @type,
        volume: @volume,
        price: @price,
        market: @market.id,
        ord_type: 'limit' }
    end

  end
end
