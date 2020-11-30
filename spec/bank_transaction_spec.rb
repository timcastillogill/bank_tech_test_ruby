require 'bank_transaction'

describe BankTransaction do
  
  let(:banking) { described_class.new }
  
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
  

end