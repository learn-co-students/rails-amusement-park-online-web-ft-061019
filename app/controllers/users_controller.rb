class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.id
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notify] = "Please be sure to fill out all the fields - all are required."
      redirect_to new_user_path
    end
  end
  
  def show
    if is_logged_in?
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

private 

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end
