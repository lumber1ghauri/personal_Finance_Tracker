class Transaction < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :description, presence: true
  validates :transaction_type, presence: true, inclusion: { in: [ "income", "expense" ] }

  scope :income, -> { where(transaction_type: "income") }
  scope :expense, -> { where(transaction_type: "expense") }
  scope :by_date_range, ->(start_date, end_date) { where(date: start_date..end_date) }

  def self.total_income
    income.sum(:amount)
  end

  def self.total_expense
    expense.sum(:amount)
  end
end
