require 'transaction_history'

describe TransactionHistory do
  subject(:transaction_history) {described_class.new}

  let(:date) {Time.new.strftime("%Y-%m-%d")}
  let(:withdrawals) {0}
  let(:deposits) {1000}
  let(:balance) {1000}

  describe "Initialization" do
    it 'has an empty statement array when initialzed' do
      expect(transaction_history.statement).to be_empty
    end
  end

  describe "#add_balance_log" do
    it 'stores balance log' do
      transaction_history.add_transaction(date, withdrawals, deposits, balance)
      expect(transaction_history.statement).to eq [{date: date, withdrawals: withdrawals, deposits: deposits, balance: balance}]
    end
  end

  describe "#display_statement" do
    it 'displays bank account balance' do
      transaction_history.add_transaction(date, withdrawals, deposits, balance)
      transaction_history.add_transaction(date, withdrawals, deposits, balance + deposits)
      expect(transaction_history.display_statement).to eq nil
    end
  end
end
