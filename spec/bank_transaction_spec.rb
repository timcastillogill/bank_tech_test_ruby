require 'bank_transaction'

describe BankTransaction do
  
  let(:banking) { described_class.new }
  let(:date) { Date.today.strftime("%d/%m/%Y") }
  
  it 'returns the current date' do
    expect(banking.date).to eq '30/11/2020'
  end

  it 'accepts a deposit amount of £100.00' do
    banking.deposit(100)
    expect(banking.credit).to include(100.00)
  end

  it 'accepts a withdrawl amount of £100.00' do
    banking.withdrawl(100)
    expect(banking.debit).to include(100.00)
  end

  it 'adds the date when money is deposited' do
    banking.deposit(50)
    expect(banking.credit).to include 50 => date
  end

  it 'adds the date when money is withdrawn' do
    banking.withdrawl(50)
    expect(banking.debit).to include 50 => date
  end
end