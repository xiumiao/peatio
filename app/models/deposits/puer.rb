module Deposits
  class Puer < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable
  end
end