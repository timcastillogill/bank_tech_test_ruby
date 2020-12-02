# frozen_string_literal: true

def many_deposits
  @transaction.deposit(100)
  @transaction.deposit(200)
  @transaction.deposit(300)
  @transaction.deposit(400)
end

def withdraw
  @transaction.deposit(1000)
  @transaction.withdraw(500)
  @transaction.withdraw(50)
end

def many_deposits_and_withdrawls
  @transaction.deposit(1000)
  @transaction.deposit(100)
  @transaction.withdraw(50)
  @transaction.deposit(200)
  @transaction.withdraw(500)
  @transaction.deposit(300)
  @transaction.deposit(400)
end
