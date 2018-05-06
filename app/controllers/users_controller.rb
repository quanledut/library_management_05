class UsersController < ApplicationController
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
      render "new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_url if @user.nil?
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update user_params
      flash[:success] = t "app.controllers.users_controller.success"
      redirect_to @user
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :address, :create_date, :password, :password_confirmation)
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end
end
