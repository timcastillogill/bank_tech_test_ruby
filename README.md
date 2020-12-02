# Bank Tech Test

### Get Started

- Clone this project:

[`https://github.com/timcastillogill/bank_tech_test_ruby.git`](https://github.com/timcastillogill/bank_tech_test_ruby.git)

- Once you are in the directory in your terminal. Run:

    `bundle install`

### Using the Programme

- First of all you will need to run the programme using IRB

    `$irb`

- Then require two files

    `require './lib/bank_statement_printer.rb'`

    `require 'time'`

- We need to firstly instantiate a new bank transaction so that we can make deposits and withdrawals as well as see our balance.

    `tim = BankTransaction.new`

- We then need to instantiate a new bank statement printer. This will allow us to see any transactions we make with our money in one simple place.

    `ing = BankStatementPrinter.new(tim)`

- You are now able to make deposits and withdrawals on your bank account.

    ```ruby
    tim.deposit(100)
    tim.withdraw(50)
    ```

- If you want to see your current balance:

    `tim.balance`

- If you want to see all the deposits you have made:

    `tim.credit`

- If you want to see al the withdrawals you have made:

    `tim.debit`

You cannot withdraw more funds than you have, no overdraft just yet!

Once you have done some spending you can print your statement to see all your deposits, withdrawals, balance and date of action: 

`ing.printer`

---

## User Stories

```markdown
As a client,
So that I can store money in the bank,
I can deposit money

As a client,
So that I can remove my money from the bank,
I can withdraw money

As a client,
So that I can a record of changes in my account
I can print a bank statement

As a client,
So that I can see when my deposits were,
I can see the dates of deposits on my statement

As a client,
So that I can see when my withdrawals were,
I can see the dates of withdrawals on my statement

As a client,
So that I can see if the transaction was a credit or debit,
The statement will have headings separated with ||
```
### Planning Tables

![alt text](https://github.com/timcastillogill/bank_tech_test_ruby/blob/main/diagrams/Screenshot%202020-12-02%20at%2017.21.14.png)

![alt text](https://github.com/timcastillogill/bank_tech_test_ruby/blob/main/diagrams/Screenshot%202020-12-02%20at%2017.25.37.png)



## Approach

- Began writing user stories and writing the above tables in order to visualise what methods the user will need in order to use the programme.
- Following a TDD approach in order to have rock-steady code
- I tried to ensure the code was readable by using descriptive method and class names
- I wanted the programme to be adaptable, which is why I have separated the printer from the transactions.
- I use notion to journal where I am and what needs to be done next.

### Test Coverage

```markdown
17 examples, 0 failures

COVERAGE:  99.29% -- 140/141 lines in 5 files

+----------+-------------------------------+-------+--------+---------+
| coverage | file                          | lines | missed | missing |
+----------+-------------------------------+-------+--------+---------+
|  95.65%  | lib/bank_statement_printer.rb | 23    | 1      | 18      |
+----------+-------------------------------+-------+--------+---------+
```

---

## **Specification**

### **Requirements**

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### **Acceptance criteria**

**Given** a client makes a deposit of 1000 on 10-01-2012

**And** a deposit of 2000 on 13-01-2012

**And** a withdrawal of 500 on 14-01-2012

**When** she prints her bank statement

**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```