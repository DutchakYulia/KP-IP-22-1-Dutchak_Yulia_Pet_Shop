class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.to_s.downcase.strip
    @user.role ||= "user"
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Акаунт створено"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
