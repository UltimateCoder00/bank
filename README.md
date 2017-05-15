# Bank Account App

## Description
This project is built using ruby 2.4.0 that creates the same facilities a bank account does. Banks accounts are allowed to have deposits, withdrawals and print statements. See specification for more details.

## Specification

### Requirements
The following list describes the requirements for this project:
* Create a program for handling a bank account.
* Deposits can be made into the bank account.
* Withdrawals can be made from the bank account.
* Account statement can be printed (date, withdrawals, deposits, balance)
* Your code should be able to interact with the IRB console.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012 and a deposit of 2000 on 13-01-2012 and a withdrawal of 500 on 14-01-2012 when they prints their bank statement then they would see

```
   Date    ||  Withdrawals  ||  Deposits  ||  Balance
14/01/2012 ||               ||   £500.00  || £2500.00
13/01/2012 ||    £2000.00   ||            || £3000.00
10/01/2012 ||    £1000.00   ||            || £1000.00
```

## User stories
The following user stories were used to achieve the specification:

```
As a client,
so that I can use the services provided by the bank,
I want to be able to have a bank account.

As a client,
so that I am able to save money,
I want to be able to deposit into my bank account.

As a client,
so that I am able to use the money I have saved,
I want to be able to withdraw money from my bank account.

As a client,
so that I can monitor my balance history,
I want to be able view my bank account statement.
```


## Usage

### Installation
To install the program do the following:

```
- Clone this repo
- Run cd bank
- Run bundle install
```

### Run tests
To run the tests do:

```
- Run rspec
```

### Use program
To use the program:

```
- Run irb:
```

### Program Example
```
 ```
