class DashboardController < ApplicationController
  before_action :authenticate_account!

  def index
    # Get the current account's transactions
    @transactions = current_account.transactions

    # Total income, expense, and balance
    @total_income = calculate_income_expense[:income]
    @total_expense = calculate_income_expense[:expense]
    @balance = @total_income - @total_expense

    # Separate data for line chart (income and expense by day)
    @income_data = @transactions.where(transaction_type: "income")
                                .group_by_day(:date).sum(:amount)
    puts "Income Data: #{@income_data.inspect}" # Add this to check

    @expense_data = @transactions.where(transaction_type: "expense")
                                 .group_by_day(:date).sum(:amount)
    puts "Expense Data: #{@expense_data.inspect}" # Add this to check

    # Donut chart: Expenses grouped by category
    @category_expenses = calculate_expenses_by_category
    puts "Category Expenses: #{@category_expenses.inspect}" # Add this to check
  end

  private

  # Calculate total income and expense for a given account
  def calculate_income_expense
    total_income = current_account.transactions.where(transaction_type: "income").sum(:amount)
    total_expense = current_account.transactions.where(transaction_type: "expense").sum(:amount)
    { income: total_income, expense: total_expense }
  end

# Calculate expenses by category for a given account
def calculate_expenses_by_category
  current_account.transactions
                 .joins(:category)
                 .where(transaction_type: "expense", categories: { category_type: "Expense" })
                 .group("categories.name")
                 .sum(:amount)
end
end
