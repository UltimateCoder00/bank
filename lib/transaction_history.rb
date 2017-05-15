class TransactionHistory

  attr_reader :statement

  def initialize
    @statement = []
  end

  def add_transaction(date = Time.new.strftime("%Y-%m-%d"), withdrawals, deposits, balance)
    self.statement << {date: date, withdrawals: withdrawals, deposits: deposits, balance: balance}
  end

  def display_statement
    Statement.new(@statement).display
  end

  private

  attr_writer :statement

end
