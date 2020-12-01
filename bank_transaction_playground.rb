require './lib/bank_transaction.rb'
require './lib/bank_statement_printer.rb'
require 'time'

p transaction = BankTransaction.new
p statement = BankStatementPrinter.new(transaction)

p 'DEPOSIT 100'
p transaction.deposit(100)
p 'WITHDRAW 20'
p transaction.withdraw(20)

p 'CREDIT HASH'
p transaction.credit

p 'BALANCE FROM BANKING'
p transaction.balance

p 'BALANCE FROM PRINTER'
p statement.printer