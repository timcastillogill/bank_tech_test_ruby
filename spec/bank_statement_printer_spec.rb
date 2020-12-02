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
    expect(statement.import_credit_transactions).to eq 4=>[400, date, 1000, 'credit'], 3=>[300, date, 600, 'credit'], 2=>[200, date, 300, 'credit'], 1=>[100, date, 100, 'credit']
  end

  it 'will output all debit transactions with a debit element' do
    @transaction.deposit(1000)
    @transaction.withdraw(500)
    @transaction.withdraw(50)
    expect(statement.import_debit_transactions).to eq 3=>[50, date, 450, 'debit'], 2=>[500, date, 500, 'debit']
  end

  it 'will merge credit and debit transactions' do
    @transaction.deposit(1000)
    @transaction.withdraw(500)
    @transaction.withdraw(50)
    expect(statement.merged_transactions).to eq 3=>[50, date, 450, 'debit'], 2=>[500, date, 500, 'debit'], 1=>[1000, date, 1000, 'credit']
  end

  it 'will return the balance of a client after 1 DEPOSIT' do
    @transaction.deposit(100)
    expect(statement.printer).to eq "date  | |  credit  | |  debit  | |  balance\n#{date}  | |  100  | |  | |  100\n"
  end

  it 'will return the balance of a client after 2 DEPOSITs and BALANCE should change' do
    @transaction.deposit(100)
    @transaction.deposit(500)
    expect(statement.printer).to eq "date  | |  credit  | |  debit  | |  balance\n#{date}  | |  500  | |  | |  600\n#{date}  | |  100  | |  | |  100\n"
  end

end