class SessionController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end 

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end 

  def destroy 
    session.delete("user_id")
    session[:user_id] = nil   
    redirect_to root_path
  end 

  private
 
  def auth
    request.env['omniauth.auth']
  end
end