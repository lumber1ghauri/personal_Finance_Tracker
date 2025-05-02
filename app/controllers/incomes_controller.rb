class IncomesController < ApplicationController
  before_action :set_income, only: %i[ show edit update destroy ]

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.ordered
  end

  # GET /incomes/1 or /incomes/1.json
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes or /incomes.json
  def create
    @income = Income.new(income_params)

    if @income.save
      redirect_to @income, notice: "Income was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incomes/1 or /incomes/1.json
  def update
    if @income.update(income_params)
      redirect_to @income, notice: "Income was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /incomes/1 or /incomes/1.json
  def destroy
    @income.destroy
    redirect_to incomes_url, notice: "Income was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.require(:income).permit(:title, :amount, :date, :note)
    end
end
