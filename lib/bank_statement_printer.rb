require_relative 'bank_transaction'

class BankStatementPrinter

  def initialize(transaction)
    @transaction = transaction
  end

  def column_titles
    'date  | |  credit  | |  debit  | |  balance'
  end

  def printer
    printing = ""
    
  end

  def merged_transactions
    import_credit_transactions.merge(import_debit_transactions).sort.reverse_each.to_h
  end


  def import_credit_transactions
    credit_transactions = @transaction.credit.reverse_each.to_h
    credit_transactions.each { | key, array |
      array.push('credit')
    }
  end

  def import_debit_transactions
    debit_transactions = @transaction.debit.reverse_each.to_h
    debit_transactions.each { | key, array |
      array.push('debit')
    }
  end


end
