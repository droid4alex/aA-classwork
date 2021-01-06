class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :logged_in?

  #session[:session_token]    #this is the cookie
  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def current_user
    return nil unless session[:session_token] #good practice, so we don't uncessarily ping the database
    @current_user ||= User.find_by(session_token: session[:session_token])

  end
  
  def logged_in?
    return false if current_user.nil?
    true
    #!!current_user        #can also use this way
  end

  def logout
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil

  end

  def require_logged_in
    #debugger
    redirect_to new_session_url unless logged_in?
    # if current_user.nil?
    #   redirect_to new_session_url
    # end
  end
end
# Finally, take some time to refactor out shared code & add some convenience methods to ApplicationController. Make sure to include the appropriate methods in your views as helper methods (e.g. helper_method :current_user). You'll probably want:

# #current_user to return the current user.
# #logged_in? to return a boolean indicating whether someone is signed in.
# #log_in_user!(user) reset the users session token and cookie