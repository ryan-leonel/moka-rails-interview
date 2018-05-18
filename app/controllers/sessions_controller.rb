class SessionsController < ApplicationController
  # skip authentication for methods
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def new
    redirect_to current_user if current_user
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
