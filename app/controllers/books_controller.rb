class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
    @book = Book.find_by id: params[:id]
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save?
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by id: params[:id]
  end

  def update
    @book = Book.find_by id: params[:id]
    if @book.update_attributes(books_params)
      redirect_to :show, id: @book
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def books_params
    params.require(:book).permit(:name, :author, :price, :publisher, :detail, :category, :total_amount, :ready_amount)
  end
end
