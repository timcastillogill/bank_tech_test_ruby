# frozen_string_literal: true

require 'bank_statement_printer'
require 'bank_transaction'
require 'time'

describe BankTransaction do
  let(:transaction) { BankTransaction.new }
  let(:statement) { BankStatementPrinter.new(transaction) }

  context '#deposit money' do
    it 'allows the client to deposit money' do
      expect { transaction.deposit(100) }.to change { transaction.balance }.by 100
    end
  end

  context '#withdraw money' do
    it 'allows the client to deposit money' do
      transaction.deposit(200)
      expect { transaction.withdraw(100) }.to change { transaction.balance }.by(-100)
    end

    # it 'will not allow client to be overdrawn' do
    #   expect {transaction.withdraw(100)}.to output('You do not have the funds. Please ask inside about a payday loan').to_stdout
    # end
  end
end
