module Deposits
  class Puercha < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable
  end
end