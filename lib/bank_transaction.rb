class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Hash.new { | hash, key | hash[key] }
    @debit = Array.new
  end

  def deposit(money)
    @credit[money] = date
    # @credit.push(money)
  end
  
  def withdrawl(money)
    @debit.push(money)
  end
  
  
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end