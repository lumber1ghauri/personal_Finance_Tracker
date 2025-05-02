class Transaction < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :date, presence: true

  scope :income, -> { where(transaction_type: "income") }
  scope :expense, -> { where(transaction_type: "expense") }
  scope :by_date_range, ->(start_date, end_date) { where(date: start_date..end_date) }
  scope :by_user, ->(user) { where(user_id: user.id) }

  def self.total_income
    income.sum(:amount)
  end

  def self.total_expense
    expense.sum(:amount)
  end

  def self.balance
    total_income - total_expense
  end
end
