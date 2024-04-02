class RegistrationsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  def new
      # @user = Customer.new
      @location = Location.all
    end
  def create
    # @user = Customer.new(user_params)
    location = params[:location]&.reject(&:empty?)
    user = Customer.new(
      f_name: params[:f_name],
      l_name: params[:l_name],
      email: params[:email],
      password_digest: BCrypt::Password.create(params[:password_digest]),
      category: params[:category]
    )
    if user.save
      location.each do |f|
        location_to_add = Location.find(f)
        user.locations << location_to_add
      end
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Registration Successful'
    else
      redirect_to registrations_path, notice: 'Signup failed!'
    end
  end
  # private
  # def user_params
  #     params.require(:user).permit(:f_name,:l_name , :email, :category, :password, :password_confirmation)
  # end
end