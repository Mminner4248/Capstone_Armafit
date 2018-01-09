module ApplicationHelper
#method checks if user is logged in based on the session id and the current user global variable. 
    private
    def logged_in?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
