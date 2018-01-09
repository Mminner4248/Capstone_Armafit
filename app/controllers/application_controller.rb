class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


private 
# current_user creates a global variable that can be used throughout project compare user_id
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "User Not Authorized" if current_user.nil?
  end
end
