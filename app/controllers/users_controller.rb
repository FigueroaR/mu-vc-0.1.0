class UsersController < ApplicationController
  def index 
    @user = User.all
  end
  def new 
    @user = User.new
  end 


  def create 
    #binding.pry
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
  end 


  def show

  end 

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end 
end 