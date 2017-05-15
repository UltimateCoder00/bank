class Statement

  attr_reader :print

  def initialize(statement)
    @print = statement
  end

  def display
    puts "   Date    ||  Withdrawals  ||  Deposits  ||  Balance"

    @print.each do |element|
      puts element
    end

    nil
  end
end
