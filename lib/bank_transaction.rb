class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Hash.new { | amount, date | amount[date] }
    @debit = Hash.new { | amount, date | amount[date] = [] }
    @transaction_number = 0
    @total_credit = 0
    @total_debit = 0
  end

  def deposit(money)
    @credit[@transaction_number += 1] = [money, date]
  end
  
  def withdrawl(money)
    @debit[@transaction_number += 1] = [money, date]
  end


  def credit_calculator
    credit_sum = 0
    @credit.each { | key, array |
      credit_sum +=  array.first
    }
    @total_credit += credit_sum
  end

  def  debit_calculator
    debit_sum = 0
    @debit.each { | key, array |
      debit_sum +=  array.first
    }
    @total_debit += debit_sum
  end
  
  def balance
    @total_credit - @total_debit
  end
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end