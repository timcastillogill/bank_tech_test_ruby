require './lib/bank_transaction.rb'
require 'time'

p banking = BankTransaction.new

p 'DEPOSIT 100'
p banking.deposit(100)

p 'WITHDRAW 200' 
p banking.withdraw(200)
