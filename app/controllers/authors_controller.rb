class AuthorsController < ApplicationController
  def index
    @author = Author.all
    if params[:search]
      @author = Author.search(params[:search]).order("created_at DESC")
    else
      @author = Author.all.order("created_at DESC")
    end
  end

  def show
    @author = Author.find_by id: params[:id]
    if @author
    else
      flash[:error] = "You did not create new author"
      redirect_to new_authors_path
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(authors_params)
    if @author.save
      flash[:success] = "Success to create new author"
      redirect_to @author
    else
      render :new
    end
  end

  def edit
    @author = Author.find_by id: params[:id]
  end

  def update
    @author = Author.find_by id: params[:id]
    if @author.update_attributes(authors_params)
      redirect_to "show"
    else
      render :edit
    end
  end

  def destroy
    Author.find_by(params[:id]).destroy
    redirect_to authors_path
  end

  private

  def authors_params
    params.require(:author).permit(:name, :detail)
  end
end
