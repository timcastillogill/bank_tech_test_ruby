# frozen_string_literal: true

require_relative 'bank_transaction'

class BankStatementPrinter
  def initialize(transaction)
    @transaction = transaction
  end

  def column_titles
    'date  | |  credit  | |  debit  | |  balance'
  end

  def printer
    printing = ["#{column_titles}\n"]
    merged_transactions.each do |_key, array|
      case array[3]
      when 'credit'
        printing.push("#{array[1]}  | |  #{array[0]}  | |  | |  #{array[2]}\n")
      when 'debit'
        printing.push(("#{array[1]}  | |  | |  #{array[0]}  | |  #{array[2]}\n"))
      end
    end
    printing.join('')
  end

  def merged_transactions
    import_credit_transactions.merge(import_debit_transactions).sort.reverse_each.to_h
  end

  def import_credit_transactions
    credit_transactions = @transaction.credit.reverse_each.to_h
    credit_transactions.each do |_key, array|
      array.push('credit')
    end
  end

  def import_debit_transactions
    debit_transactions = @transaction.debit.reverse_each.to_h
    debit_transactions.each do |_key, array|
      array.push('debit')
    end
  end
end
