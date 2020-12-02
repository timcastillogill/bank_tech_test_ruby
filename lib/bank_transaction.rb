# frozen_string_literal: true
class BankTransaction
  attr_reader :credit, :debit, :transaction_number, :balance

  def initialize
    @credit = Hash.new { |amount, date, balance| amount[date, balance] }
    @debit = Hash.new { |amount, date, balance| amount[date, balance]  }
    @transaction_number = 0
    @balance = 0
  end

  def deposit(money)
    @credit[@transaction_number += 1] = [money, date]
    balance_calculator
    @credit[@transaction_number] = [money, date, @balance]
  end

  def withdraw(money)
    if @balance < money
      'You do not have the funds. Please ask inside about a payday loan'
    else
      @debit[@transaction_number += 1] = [money, date]
      balance_calculator
      @debit[@transaction_number] = [money, date, @balance]
    end
  end

  def credit_calculator
    credit_sum = 0
    @total_credit = 0
    @credit.each do |_key, array|
      credit_sum += array.first
    end
    @total_credit += credit_sum
  end

  def debit_calculator
    debit_sum = 0
    @total_debit = 0
    @debit.each do |_key, array|
      debit_sum += array.first
    end
    @total_debit += debit_sum
  end

  def balance_calculator
    credit_calculator
    debit_calculator
    @balance = @total_credit - @total_debit
    @balance
  end

  def date
    current = Date.today
    current.strftime('%d/%m/%Y')
  end
end
