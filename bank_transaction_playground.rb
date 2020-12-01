require './lib/bank_transaction.rb'
require 'time'

p banking = BankTransaction.new
p banking.deposit(400)
p banking.deposit(200)
p banking.withdrawl(100)

p banking.credit_calculator
p banking.debit_calculator

p banking.balance
