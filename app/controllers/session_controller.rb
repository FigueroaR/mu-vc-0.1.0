class SessionController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :fbcreate]

  def new 
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])  
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
        #flash[error try again] work with redirect not render 
        #flash.mal work with render 
        flash[:notice] = "Password/Email combination is Incorrect"
        redirect_to signin_path
      end 
  end 

  def fbcreate
    #binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
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