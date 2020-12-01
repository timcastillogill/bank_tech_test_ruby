require_relative 'bank_transaction'

class BankStatementPrinter

  def initialize(bank_transaction)
    @bank_transaction = bank_transaction
  end

  def printer
    @bank_transaction.balance
  end

end
