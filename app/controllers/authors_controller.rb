class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def show
    @author = Author.find_by id: params[:id]
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(authors_params)
    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authors_params
    params.require(:author).permit(:name, :detail)
  end
end
