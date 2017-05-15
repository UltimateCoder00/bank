require 'bank_account'

describe BankAccount do

  subject(:bank_account) {described_class.new}

  let(:stubbed_bank_account) {double(:stubbed_bank_account, statement: statement)}
  let(:statement) {:statement}

  let(:deposit_amount) {1000}
  let(:withdrawal_amount) {500}

  let(:date) {Time.new.strftime("%Y-%m-%d")}
  let(:withdrawals) {0}
  let(:deposits) {1000}
  let(:balance) {1000}

  non_positive_integers_message = "Please enter a postive integer"
  empty_account_message = 'Sorry your bank balance is 0, you cannot withdraw money'
  over_limit_account_message = "Sorry your bank balance is £500, you cannot withdraw more than this amount"

  describe "Initialization" do
    it 'displays empty bank account balance' do
      expect(bank_account.balance).to eq 0
    end

    it 'displays bank account statement' do
      expect(stubbed_bank_account.statement).to eq statement
    end
  end

  describe '#deposit' do
    it 'deposits money into bank account' do
      bank_account.deposit(deposit_amount)
      expect(bank_account.balance).to eq deposit_amount
    end

    context 'Errors' do
      it 'cannot deposit string values into bank account' do
        expect{bank_account.deposit("sbrtbhdfgn")}.to raise_error non_positive_integers_message
      end

      it 'cannot deposit negative values into bank account' do
        expect{bank_account.deposit(-100)}.to raise_error non_positive_integers_message
      end
    end
  end

  describe '#withdrawal' do
    it 'withdraws money from bank account' do
      bank_account.deposit(deposit_amount)
      bank_account.withdraw(withdrawal_amount)
      expect(bank_account.balance).to eq (deposit_amount - withdrawal_amount)
    end

    context 'Errors' do
      it 'cannot withdraw string values from bank account' do
        bank_account.deposit(deposit_amount)
        expect{bank_account.withdraw("sbrtbhdfgn")}.to raise_error non_positive_integers_message
      end

      it 'cannot withdraw negative values from bank account' do
        bank_account.deposit(deposit_amount)
        expect{bank_account.withdraw(-100)}.to raise_error non_positive_integers_message
      end

      it 'cannot withdraw money from empty bank account' do
        expect{bank_account.withdraw(withdrawal_amount)}.to raise_error empty_account_message
      end

      it 'cannot withdraw money over the current limit' do
        bank_account.deposit(deposit_amount)
        bank_account.withdraw(withdrawal_amount)
        expect{bank_account.withdraw(600)}.to raise_error over_limit_account_message
      end
    end
  end

  describe "#display_statement" do
    it 'displays bank account balance' do
      bank_account.statement.add_transaction(date, withdrawals, deposits, balance)
      bank_account.statement.add_transaction(date, withdrawals, deposits, balance + deposits)
      bank_account.statement.add_transaction(date, 500, 0, 1500)
      expect(bank_account.display_statement).to eq nil
    end
  end
end
