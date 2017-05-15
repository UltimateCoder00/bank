require 'statement'

describe Statement do

  subject(:statement) {described_class.new(statement2)}

  let(:date) {Time.new.strftime("%Y-%m-%d")}
  let(:withdrawals) {0}
  let(:deposits) {1000}
  let(:balance) {1000}
  let(:statement2) { [{date: date, withdrawals: withdrawals, deposits: deposits, balance: balance}] }

  describe "Initialization" do
    it 'has an empty statement array when initialzed' do
      expect(statement.display).to eq nil
    end
  end

  describe '#printing_statement' do
    it 'displays the bank account statement' do
      expect(statement.display).to eq nil
    end
  end
end
