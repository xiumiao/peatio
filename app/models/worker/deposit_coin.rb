module Worker
  class DepositCoin

    def process(payload, metadata, delivery_info)
      payload.symbolize_keys!

      sleep 0.5 # nothing result without sleep by query gettransaction api

      channel_key = payload[:channel_key]
      txid = payload[:txid]

      channel = DepositChannel.find_by_key(channel_key)
      raw     = get_raw channel, txid

      raw[:details].each_with_index do |detail, i|
        detail.symbolize_keys!
        deposit!(channel, txid, i, raw, detail)
      end
    end

    def deposit!(channel, txid, txout, raw, detail)
      return if detail[:account] != "payment" || detail[:category] != "receive"

      ActiveRecord::Base.transaction do
        unless PaymentAddress.where(currency: channel.currency_obj.id, address: detail[:address]).first
          Rails.logger.info "Deposit address not found, skip. txid: #{txid}, txout: #{txout}, address: #{detail[:address]}, amount: #{detail[:amount]}"
          return
        end

        return if PaymentTransaction::Normal.where(txid: txid, txout: txout).first
        # 如果交易没有被记录到数据库中，则创建这条交易（机器意外当机）
        tx = PaymentTransaction::Normal.create! \
          txid: txid,
          txout: txout,
          address: detail[:address],
          amount: detail[:amount].to_s.to_d,
          confirmations: raw[:confirmations],
          receive_at: Time.at(raw[:timereceived]).to_datetime,
          currency: channel.currency

        deposit = channel.kls.create! \
          payment_transaction_id: tx.id,
          txid: tx.txid,
          txout: tx.txout,
          amount: tx.amount,
          member: tx.member,
          account: tx.account,
          currency: tx.currency,
          confirmations: tx.confirmations

        deposit.submit!
      end
    rescue
      Rails.logger.error "Failed to deposit: #{$!}"
      Rails.logger.error "txid: #{txid}, txout: #{txout}, detail: #{detail.inspect}"
      Rails.logger.error $!.backtrace.join("\n")
    end

    def get_raw(channel, txid)
      channel.currency_obj.api.gettransaction(txid)
    end

  end
end
