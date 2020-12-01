require 'bank_statement_printer'

describe BankStatementPrinter do

  let(:statement) { described_class.new }

  it 'will return a test' do
    expect(statement.printer).to be_truthy
  end

end