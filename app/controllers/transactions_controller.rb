class TransactionsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions
  def index
    @transactions = current_account.transactions
  end

  # GET /transactions/1
  def show
    @transaction = current_account.transactions.find(params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = current_account.transactions.build
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  def create
    @transaction = current_account.transactions.build(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "✅ Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "✅ Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_path, status: :see_other, notice: "🗑️ Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = current_account.transactions.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:category_id, :date, :amount, :transaction_type)
  end
end
