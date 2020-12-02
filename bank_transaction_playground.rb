# frozen_string_literal: true

require './lib/bank_transaction'
require './lib/bank_statement_printer'
require 'time'

p transaction = BankTransaction.new
p statement = BankStatementPrinter.new(transaction)

p 'DEPOSIT 100'
p transaction.deposit(100)
p 'BALANCE'
p transaction.balance

p 'DEPOSIT 100'
p transaction.deposit(100)

p 'WITHDRAW 50'
p transaction.withdraw(50)

p 'BALANCE'
p statement.merged_transactions

p 'PRINTER'
print statement.printer
