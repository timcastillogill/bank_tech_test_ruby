class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Hash.new { | amount, date | amount[date] = [] }
    @debit = Hash.new { | amount, date | amount[date] = [] }
  end

  def deposit(money)
    counter = 0
    @credit[counter += 1] = [money, date]
  end
  
  def withdrawl(money)
    counter = 0
    @debit[counter += 1] = [money, date]
  end

  def total_credit
    @credit.each { | amount, date | 
      amount += amount
    }
  end
  
  # def balance
  #   total_credit = @credit.each
  # end
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end