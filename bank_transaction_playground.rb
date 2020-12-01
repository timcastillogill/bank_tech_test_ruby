require './lib/bank_transaction.rb'
require 'time'

p banking = BankTransaction.new
p banking.deposit(400)
p banking.deposit(200)

p banking.total_credit
