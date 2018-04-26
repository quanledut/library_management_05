class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in_user user
    else
      flash[:danger] = t "app.controllers.sessions_controller.error" # Not quite right!
      render :new
    end
  end

  def logged_in?
    current_user.present?
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
