module Benchmark
  class SweatFactory

    @@seq = 0

    class <<self
      def make_member
        @@seq += 1
        member = Member.create!(
          email: "user#{@@seq}@example.com",
          display_name: "Matching Benchmark #{@@seq}"
        )
      end

      def make_order(klass, attrs={})
        klass.new({
          bid: :cny,
          ask: :puer,
          state: Order::WAIT,
          currency: :puercny,
          origin_volume: attrs[:volume],
          source: 'Web',
          ord_type: 'limit',
          locked: 0,
          origin_locked: '0'
        }.merge(attrs))
      end
    end

  end
end
