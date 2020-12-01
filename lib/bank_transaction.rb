class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Hash.new { | amount, date | amount[date] }
    @debit = Hash.new { | amount, date | amount[date] = [] }
    @transaction_number_deposit = 0
    @transaction_number_withdrawl = 0
  end

  def deposit(money)
    @credit[@transaction_number_deposit += 1] = [money, date]
  end
  
  def withdrawl(money)
    @debit[@transaction_number_withdrawl += 1] = [money, date]
  end

  def total_credit
    total_credit = 0
    @credit.each { | key, array |
      total_credit +=  array.first
    }
    return total_credit
  end
  
  # def balance
  #   total_credit = @credit.each
  # end
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end