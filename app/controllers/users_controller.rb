class UsersController < ApplicationController

  def new

  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
      flash[:notice] = "Passwords did not match"
      redirect_to '/signup'
    else
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
