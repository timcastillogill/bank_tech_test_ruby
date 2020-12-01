class BankTransaction

  attr_reader :credit, :debit, :transaction_number, :balance

  def initialize
    @credit = Hash.new { | amount, date | amount[date] }
    @debit = Hash.new { | amount, date | amount[date] = [] }
    @transaction_number = 0
    @balance = 0
  end

  def deposit(money)
    @credit[@transaction_number += 1] = [money, date]
    balance_calculator
  end
  
  def withdraw(money)
    if @balance < money
      return 'You do not have the funds. Please ask inside about a payday loan'
    else
      @debit[@transaction_number += 1] = [money, date]
      balance_calculator
    end
  end


  def credit_calculator
    credit_sum = 0
    @total_credit = 0
    @credit.each { | key, array |
      credit_sum +=  array.first
    }
    @total_credit += credit_sum
  end

  def debit_calculator
    debit_sum = 0
    @total_debit = 0
    @debit.each { | key, array |
      debit_sum +=  array.first
    }
    @total_debit += debit_sum
  end
  
  def balance_calculator
    credit_calculator
    debit_calculator
    @balance = @total_credit - @total_debit
  end
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end