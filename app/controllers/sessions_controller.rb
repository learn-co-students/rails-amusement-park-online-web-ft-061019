class SessionsController < ApplicationController
  def signin
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:name], password: params[:user][:password])
  
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notify] = "Incorrect username or password combo"
      redirect_to signin_path
    end
  end

  def signout
    session.delete :user_id
    redirect_to root_path
  end

private 
  def user_params
    params.require(:user).permit(:name, :password)
  end
  
end
