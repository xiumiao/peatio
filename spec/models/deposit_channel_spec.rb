require 'spec_helper'

describe DepositChannel do

  context "#sort" do
    let(:dc1) { DepositChannel.new }
    let(:dc2) { DepositChannel.new }

    it "sort DepositChannel" do
      dc1.stubs(:sort_order).returns 1
      dc2.stubs(:sort_order).returns 2
      expect([dc2, dc1].sort.first.sort_order).to eq(1)
    end
  end

  # ⎡ 0.1⎤                    T, F, F, F
  # ⎟ 1.0⎢                    F, T, F, F
  # ⎟ 2.0⎢ * [0, 1, 3, 7]  =  F, T, T, F
  # ⎟ 9.9⎟                    F, T, T, F
  # ⎣  ∞ ⎦                    F, T, T, F
  context "#min_confirm?" do
    let(:dc) { DepositChannel.find_by_currency('btc') }
    let(:amounts)  { [0.1, 1.0, 2.0, 9.9, Float::INFINITY] }
    let(:confirms) { [0, 1, 3, 7] }
    let(:results)  { [[ true,  false, false, false ],
                      [ false, true,  false, false ],
                      [ false, true,  true,  false ],
                      [ false, true,  true,  false ],
                      [ false, true,  true,  false ]] }
    it "returns true/false according deposit amount and confirmations" do
      amounts.each_with_index do |amount, i|
        confirms.each_with_index do |count, j|
          expect(dc.min_confirm?(deposit_amount: amount, confirmation_count: count)).to equal(results[i][j])
        end
      end
    end
  end

  # ⎡ 0.1⎤                    F, T, T, T
  # ⎟ 1.0⎢                    F, F, T, T
  # ⎟ 2.0⎢ * [0, 1, 3, 7]  =  F, F, F, T
  # ⎟ 9.9⎟                    F, F, F, T
  # ⎣  ∞ ⎦                    F, F, F, T
  context "#max_confirm?" do
    let(:dc) { DepositChannel.find_by_currency('btc') }
    let(:amounts)  { [0.1, 1.0, 2.0, 9.9, Float::INFINITY] }
    let(:confirms) { [0, 1, 3, 7] }
    let(:results)  { [[ false, true,  true,  true ],
                      [ false, false, true,  true ],
                      [ false, false, false, true ],
                      [ false, false, false, true ],
                      [ false, false, false, true ]] }
    it "returns true/false according deposit amount and confirmations" do
      amounts.each_with_index do |amount, i|
        confirms.each_with_index do |count, j|
          expect(dc.max_confirm?(deposit_amount: amount, confirmation_count: count)).to equal(results[i][j])
        end
      end
    end
  end

end
