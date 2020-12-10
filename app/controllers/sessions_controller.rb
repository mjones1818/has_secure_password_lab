class SessionsController < ApplicationController
  
  def new
    render 'login'
  end

  def create
    
    user = User.find_by_name(user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
    else
      flash[:notice] = "Incorrect password"
      render 'login'
    end
  end

  def destroy
    session.delete :user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
