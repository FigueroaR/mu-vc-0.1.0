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
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render 'new'
    end
  end 

  def show
    #binding.pry
    @user = User.find_by(id: params[:id])
    render 'show'
  end 

  def edit 
    @user = User.find_by(id: params[:id])
  end 

  def update 
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    render 'show'
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 
end 