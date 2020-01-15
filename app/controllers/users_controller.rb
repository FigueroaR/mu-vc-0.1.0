class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :edit]
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
    @past = @user.events.previous_events(Time.zone.now)
    @coming = @user.events.upcoming_events(Time.zone.now)
    if @user.id == current_user.id 
      render 'show'
    else
      render 'theirprofile'
    end
  end 

  def edit 

    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id 
      render 'edit'
    else 
      redirect_to user_path(@user)
    end 
  end 

  def update 
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    render 'show'
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :photo, :password)
  end 
end 