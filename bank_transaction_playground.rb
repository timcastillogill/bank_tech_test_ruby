# frozen_string_literal: true

require './spec/web_helper'
require './lib/bank_transaction'
require './lib/bank_statement_printer'
require 'time'

transaction = BankTransaction.new
statement = BankStatementPrinter.new(transaction)

# p 'DEPOSIT 100'
# p transaction.deposit(100)
# p 'BALANCE'
# p transaction.balance

# p 'DEPOSIT 100'
# p transaction.deposit(100)

# p 'WITHDRAW 50'
# p transaction.withdraw(50)

# p 'BALANCE'
# p statement.merged_transactions

# p 'PRINTER'
# print statement.printer

p 'FOR FEATURE TEST'
transaction.deposit(1000)
transaction.deposit(200)
transaction.withdraw(400)
transaction.withdraw(50)
puts statement.printer
