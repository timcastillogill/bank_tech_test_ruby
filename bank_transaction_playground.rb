require './lib/bank_transaction.rb'
require 'time'

p banking = BankTransaction.new

p "DEPOSIT 200"
p banking.deposit(200)

p "TOTAL_CREDIT EXP 200"
p banking.total_credit

p "DEPOSIT 400"
p banking.deposit(400)

p "TOTAL_CREDIT EXP 600"
p banking.balance

p "BALANCE EXP 600"
p banking.balance