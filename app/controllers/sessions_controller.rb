class SessionsController < ApplicationController
  def new
  end
  
  #emails and password params from the database match what is entered, the user is logged in, otherwise it alerts.  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  #When user clicks log out, it returns the current sessions user_id to nil. 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end