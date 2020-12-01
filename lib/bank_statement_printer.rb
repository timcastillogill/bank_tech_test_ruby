require_relative 'bank_transaction'

class BankStatementPrinter

  def initialize(transaction)
    @transaction = transaction
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

  def printer
    printable_string = ""
    
  end


end
