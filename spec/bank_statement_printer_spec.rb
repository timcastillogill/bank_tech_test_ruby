require 'bank_statement_printer'

describe BankStatementPrinter do

  before :each do
    @transaction = BankTransaction.new
  end

  let(:statement) { described_class.new(@transaction) }

  it 'will return the balance of a client' do
    @transaction.deposit(100)
    expect(statement.printer).to eq 100
  end

end