class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  def new
  end

  def create
    user = Customer.find_by(email: params[:customer][:email])
    password = params[:customer][:password]

    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in Successfully'
    else
      redirect_to login_path, alert: 'Invalid username or password! Try again.'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have logged out'
  end
end