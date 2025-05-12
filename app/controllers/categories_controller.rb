class CategoriesController < ApplicationController
  before_action :authenticate_account!

  def index
    @categories = current_account.categories.order(:id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_account.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category created successfully."
    else
      render :new
    end
  end

  def edit
    @category = current_account.categories.find(params[:id])
  end

  def update
    @category = current_account.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @category = current_account.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:name, :category_type)
  end
end
