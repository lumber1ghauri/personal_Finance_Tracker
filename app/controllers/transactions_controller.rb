class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]

  def index
    @transactions = Transaction.includes(:category).order(date: :desc)
    @transactions = @transactions.by_date_range(params[:start_date], params[:end_date]) if params[:start_date].present? && params[:end_date].present?
    @transactions = @transactions.where(transaction_type: params[:type]) if params[:type].present?
    @transactions = @transactions.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def new
    @transaction = Transaction.new
    @categories = Category.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path, notice: 'Transaction was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: 'Transaction was successfully updated.'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path, notice: 'Transaction was successfully deleted.'
  end

  def summary
    @start_date = params[:start_date].presence || Date.today.beginning_of_month
    @end_date = params[:end_date].presence || Date.today.end_of_month

    @transactions = Transaction.by_date_range(@start_date, @end_date)
    @total_income = @transactions.income.total_income
    @total_expense = @transactions.expense.total_expense
    
    @income_by_category = @transactions.income
      .joins(:category)
      .group('categories.name')
      .sum(:amount)
    
    @expense_by_category = @transactions.expense
      .joins(:category)
      .group('categories.name')
      .sum(:amount)
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :date, :description, :transaction_type, :category_id)
  end
end 