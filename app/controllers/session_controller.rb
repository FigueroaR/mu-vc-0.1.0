class SessionController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    redirect_to user_path(session[:user_id])
  end 

  def destroy 
    session.delete("user_id")
    redirect_to root_path
  end 
end