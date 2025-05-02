class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @total_income = current_user.incomes.sum(:amount)
    @total_expense = current_user.expenses.sum(:amount)
    @balance = @total_income - @total_expense
  end
end
