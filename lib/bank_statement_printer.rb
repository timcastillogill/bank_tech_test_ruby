require_relative 'bank_transaction'

class BankStatementPrinter

  def initialize(transaction)
    @transaction = transaction
  end

  def column_titles
    'date  | |  credit  | |  debit  | |  balance'
  end

  def printer
    #{3=>[50, "02/12/2020", "debit"], 2=>[500, "02/12/2020", "debit"], 1=>[1000, "02/12/2020", "credit"]}
    printing = ["#{column_titles}\n"]
    merged_transactions.each { | key, array | 
      if array[3] == 'credit'
        printing.push("#{array[1]}  | |  #{array[0]}  | |  | |  #{array[2]}\n")
      elsif array[3] == 'debit'
        printing.push(("#{array[1]}  | |  | |  #{array[0]}  | |  #{array[2]}\n"))
      end
    }
    return printing.join("")
  end

  def merged_transactions
    p import_credit_transactions.merge(import_debit_transactions).sort.reverse_each.to_h
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
