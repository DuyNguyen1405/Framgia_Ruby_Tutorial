class SessionsController < ApplicationController

  def create
    session = params[:session]
    user = User.find_by email: session[:email].downcase
    if user && user.authenticate(session[:password])
      if user.activated?
        log_in user
        session[:remember_me] == "1" ? remember(user) : forget(user)
        redirect_to user
      else
        flash[:warning] = t "account_not_activated"
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
