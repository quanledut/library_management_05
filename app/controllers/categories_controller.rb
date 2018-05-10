class CategoriesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = if params[:search]
                  Category.search(params[:search]).search_by_created_at
                else
                  Category.search_by_created_at
                end
  end

  def show
    return if @category.present?
    redirect_to new_categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t ".success"
      redirect_to @category
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit :parent_ID, :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category.present?
    redirect_to categories_path
  end
end
