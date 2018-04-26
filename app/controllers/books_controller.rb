class BooksController < ApplicationController
  before_action :load_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = if params[:search]
               Book.search(params[:search]).search_by_created_at
             else
               Book.search_by_created_at
             end
  end

  def show
    return if @book.present?
    redirect_to new_book_path
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to @book
    else
      @authors = Author.all
      render :new
    end
  end

  def edit
    @authors = Author.all
    @categores = Category.all
  end

  def update
    if @book.update(books_params)
      redirect_to @book
    else
      @authors = Author.all
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit :name, :price, :author_id, :publisher,
      :detail, :category_id, :total_amount, :ready_amount
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book.present?
    redirect_to books_path
  end
end
