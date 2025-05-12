class ReportsController < ApplicationController
  before_action :authenticate_account!
  def index
    @monthly_data = Transaction
      .joins(:category)
      .select(
        "DATE_TRUNC('month', transactions.date) AS month",
        "SUM(CASE WHEN categories.category_type = 'Income' THEN transactions.amount ELSE 0 END) AS total_income",
        "SUM(CASE WHEN categories.category_type = 'Expense' THEN transactions.amount ELSE 0 END) AS total_expense"
      )
      .group("DATE_TRUNC('month', transactions.date)")
      .order("month DESC")
      .limit(6)

    @chart_labels = @monthly_data.map { |d| d.month.strftime("%b %Y") }
    @chart_income = @monthly_data.map { |d| d.total_income.to_f }
    @chart_expense = @monthly_data.map { |d| d.total_expense.to_f }
    @total_income = @chart_income.sum
    @total_expense = @chart_expense.sum
  end
end
