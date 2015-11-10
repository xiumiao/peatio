module Private
  module Deposits
    class PuersController < BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end