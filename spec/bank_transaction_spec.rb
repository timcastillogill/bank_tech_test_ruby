require 'bank_transaction'

describe BankTransaction do
  
  let(:banking) { described_class.new }
  let(:date) { Date.today.strftime("%d/%m/%Y") }
  
  it 'returns the current date' do
    expect(banking.date).to eq date
  end

  it 'accepts a deposit amount of £100.00' do
    banking.deposit(100)
    expect(banking.credit).to eq 1 => [100, date, 100]
  end

  it 'accepts a deposit amount of £100.00 + £200.00' do
    banking.deposit(100)
    banking.deposit(200)
    expect(banking.credit).to eq 1=> [100, date, 100], 2=>[200, date, 300]
  end

  it 'accepts a withdraw amount of £100.00' do
    banking.deposit(200)
    banking.withdraw(100)
    expect(banking.debit).to eq 2=>[100.00, date, 100]
  end

  it 'adds the date when money is deposited' do
    banking.deposit(50)
    banking.deposit(500)
    expect(banking.credit).to include {[50, date]}
  end

  it 'adds the date when money is withdrawn' do
    banking.withdraw(50)
    expect(banking.debit).to include {[50, date]}
  end

  it 'will calculate the total CREDIT in a clients account' do
    banking.deposit(200)
    banking.deposit(400)
    expect(banking.balance).to eq 600
  end

  it 'will calculate the total DEBITS on a clients account' do
    banking.deposit(1000)
    banking.withdraw(300)
    banking.withdraw(200)
    expect(banking.balance).to eq 500
  end

  it 'will calculate the clients balance' do
    banking.deposit(1000)
    banking.withdraw(100)
    expect(banking.balance).to eq 900.00
  end

  # EDGE CASE
  it 'will not allow a client to withdraw funds if none are available' do
    banking.deposit(100)
    expect(banking.withdraw(200)).to eq 'You do not have the funds. Please ask inside about a payday loan'
  end

end