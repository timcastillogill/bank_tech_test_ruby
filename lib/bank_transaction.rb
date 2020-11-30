class BankTransaction

  attr_reader :credit, :debit

  def initialize
    @credit = Array.new
    @debit = Array.new
  end

  def deposit(amount)
    @credit.push(amount)
  end
  
  def withdrawl(amount)
    @debit.push(amount)
  end
  
  
  
  def date
    current = Date.today
    current.strftime("%d/%m/%Y")
  end


end