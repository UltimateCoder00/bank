class BankAccount
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = TransactionHistory.new
  end

  def deposit(amount)
    raise "Please enter a postive integer" unless integer?(amount)
    raise "Please enter a postive integer" unless positive_integer?(amount)
    @statement.add_transaction(Time.new.strftime("%Y-%m-%d"), 0, amount, balance + amount)
    self.balance += amount
  end

  def withdraw(amount)
    raise "Please enter a postive integer" unless integer?(amount)
    raise "Please enter a postive integer" unless positive_integer?(amount)
    raise 'Sorry your bank balance is 0, you cannot withdraw money' if empty_account?
    raise "Sorry your bank balance is £#{balance}, you cannot withdraw more than this amount" if account_withdrawal_over_limit?(amount)
    @statement.add_transaction(Time.new.strftime("%Y-%m-%d"), amount, 0, balance - amount)
    self.balance -= amount
  end

  def display_statement
    @statement.display_statement
  end

  private
  attr_writer :balance

  def integer?(amount)
    amount.is_a? Integer
  end

  def positive_integer?(amount)
    amount > 0
  end

  def empty_account?
    @balance == 0
  end

  def account_withdrawal_over_limit?(amount)
    @balance < amount
  end

end
