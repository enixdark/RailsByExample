class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # debugger
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to current_user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
