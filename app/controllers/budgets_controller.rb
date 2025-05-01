class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to budgets_path, notice: "Budget saved successfully!"
    else
      render :new
    end
  end

  def index
    @budgets = Budget.all
  end

  private

  def budget_params
    params.require(:budget).permit(:amount, :category, :date, :notes)
  end
end
