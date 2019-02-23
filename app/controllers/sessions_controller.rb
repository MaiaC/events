class SessionsController < ApplicationController
  def new
  end

  def create
    p_s = params[:session]
    user = User.find_by(email: p_s[:email])
    if user
      log_in user
      redirect_to user
    else
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
