class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= user.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in? 
  end

  def logout

  end

  def logged_in?

  end

  def login(user)
    
  end
end
