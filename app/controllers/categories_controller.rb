class CategoriesController < ApplicationController
  def index
    @category = Category.all
    if params[:search]
      @category = Category.search(params[:search]).order("created_at DESC")
    else
      @category = Category.all.order("created_at DESC")
    end
  end

  def show
    @category = Category.find_by id: params[:id]
    if @category
    else
      flash[:error] = "You did not create new category!"
      redirect_to new_categories_path
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Success to create new category!"
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by id: params[:id]
  end

  def update
    @category = Category.find_by id: params[:id]
    if @category.update_attributes(category_params)
      redirect_to "show"
    else
      render :edit
    end
  end

  def destroy
    Category.find_by(params[:id]).destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:parent_ID, :name)
  end

end
