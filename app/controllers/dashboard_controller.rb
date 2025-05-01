class DashboardController < ApplicationController
    def index
      # You can fetch any data you need here, e.g., total income, expenses, balance
      @total_income = 1000
      @total_expense = 500
      @balance = @total_income - @total_expense
    end
  end
  