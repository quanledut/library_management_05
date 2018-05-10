class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    redirect_to root_url if @user.nil?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.create_date = Time.zone.now
    if @user.save
      log_in @user
      flash[:success] = t "app.controllers.users_controller.p1"
      redirect_to @user
      # Handle a successful save.
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "app.controllers.users_controller.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone_number, :address,
      :create_date, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please login"
      redirect_to login_url
    end
  end

  def load_user
    @user = User.find_by id: session[:user_id]
    return if @user.present?
    redirect_to users_path
  end
end
