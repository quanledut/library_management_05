class AuthorsController < ApplicationController
  before_action :load_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = if params[:search]
                Author.search(params[:search]).search_by_created_at
              else
                Author.search_by_created_at
              end
  end

  def show
    return if @author.present?
    redirect_to new_authors_path
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new authors_params
    if @authors.save
      flash[:success] = t ".success"
      redirect_to @author
    else
      render :new
    end
  end

  def edit; end

  def update
    if @author.update authors_params
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def authors_params
    params.require(:author).permit :name, :detail
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author.present?
    redirect_to authors_path
  end
end
