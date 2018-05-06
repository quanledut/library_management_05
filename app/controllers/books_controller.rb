class BooksController < ApplicationController
  def index
    @book = Book.all
    if params[:search]
      @book = Book.search(params[:search]).order("created_at DESC")
    else
      @book = Book.all.order("created_at DESC")
    end
  end

  def show
    @book = Book.find_by id: params[:id]
    if @book
    else
      flash[:error] = "You did not create book!"
      redirect_to new_book_path
    end
  end

  def new
    @book = Book.new
    @author = Author.all
    @category = Category.all
  end

  def create
    @book = Book.new(books_params)
    if @book.save?
      redirect_to @book
    else
    end

    if @book.save
      redirect_to @book
    else
      @author = Author.all
      render :new
    end
  end

  def edit
    @book = Book.find_by id: params[:id]
    @author = Author.all
    @category = Category.all
  end

  def update
    @book = Book.find_by id: params[:id]
    if @book.update_attributes(books_params)
      redirect_to :show, id: @book
    else
      @author = Author.all
      @category = Category.all
      render :edit
    end
  end

  def destroy
    Book.find_by(params[:id]).destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:name, :price, :author_id, :publisher, :detail, :category_id, :total_amount, :ready_amount)
  end
end
