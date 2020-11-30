class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Hash.new { | amount, date | amount[date] }
    @debit = Hash.new { | amount, date | amount[date] }
  end

  def deposit(money)
    @credit[money] = date
  end
  
  def withdrawl(money)
    @debit[money] = date
  end
  
  
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end