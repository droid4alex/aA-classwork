class SessionsController < ApplicationController
  def new
    #debugger
    render :new
  end

  def create
    #debugger
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      #debugger
      redirect_to user_url(user)
    else
      flash.now[:errors] = ['User not found']
      # p flash.now[:errors]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end


end

# Create a SessionsController but no Session model.
# Write controller methods and the accompanying routes so that users can log in and log out. Should session be a singular resource?
# SessionsController#create should re-set the appropriate user's session_token and session[:session_token].
# For now just redirect them to a UsersController#show page which simply displays that user's email.
