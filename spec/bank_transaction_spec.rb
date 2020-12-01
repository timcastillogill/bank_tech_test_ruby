require 'bank_transaction'

describe BankTransaction do
  
  let(:banking) { described_class.new }
  let(:date) { Date.today.strftime("%d/%m/%Y") }
  
  it 'returns the current date' do
    expect(banking.date).to eq date
  end

  it 'accepts a deposit amount of £100.00' do
    banking.deposit(100)
    expect(banking.credit).to eq 1 => [100, date]
  end

  it 'accepts a deposit amount of £100.00 + £200.00' do
    banking.deposit(100)
    banking.deposit(200)
    expect(banking.credit).to eq 1=> [100, date], 2=>[200, date]
  end

  it 'accepts a withdrawl amount of £100.00' do
    banking.withdrawl(100)
    expect(banking.debit).to eq 1=>[100.00, date]
  end

  it 'adds the date when money is deposited' do
    banking.deposit(50)
    banking.deposit(500)
    expect(banking.credit).to include {[50, date]}
  end

  it 'adds the date when money is withdrawn' do
    banking.withdrawl(50)
    expect(banking.debit).to include {[50, date]}
  end

  it 'will calculate the total CREDIT in a clients account' do
    banking.deposit(200)
    banking.deposit(400)
    expect(banking.credit_calculator).to eq 600
  end

  it 'will calculate the total DEBITS on a clients account' do
    banking.deposit(1000)
    banking.withdrawl(300)
    banking.withdrawl(200)
    expect(banking.debit_calculator).to eq 500
  end

  it 'will calculate the clients balance' do
    banking.deposit(1000)
    banking.withdrawl(100)
    banking.credit_calculator
    banking.debit_calculator
    expect(banking.balance).to eq 900.00
  end

end