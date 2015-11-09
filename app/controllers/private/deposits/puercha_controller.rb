module Private
  module Deposits
    class PuerchasController < BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end