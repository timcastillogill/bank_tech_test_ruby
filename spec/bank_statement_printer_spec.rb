require 'bank_statement_printer'

describe BankStatementPrinter do

  before :each do
    @transaction = BankTransaction.new
  end

  let(:statement) { described_class.new(@transaction) }
  let(:date) { Date.today.strftime("%d/%m/%Y") }

  it 'will output all credit transactions with a credit element' do
    @transaction.deposit(100)
    @transaction.deposit(200)
    @transaction.deposit(300)
    @transaction.deposit(400)
    expect(statement.import_credit_transactions).to eq 4=>[400, date, 'credit'], 3=>[300, date, 'credit'], 2=>[200, date, 'credit'], 1=>[100, date, 'credit']
  end

  it 'will output all debit transactions with a debit element' do
    @transaction.deposit(1000)
    @transaction.withdraw(500)
    @transaction.withdraw(50)
    expect(statement.import_debit_transactions).to eq 3=>[50, date, 'debit'], 2=>[500, date, 'debit']
  end

  # it 'will return the balance of a client' do
  #   @transaction.deposit(100)
  #   expect(statement.printer).to eq 100
  # end

end