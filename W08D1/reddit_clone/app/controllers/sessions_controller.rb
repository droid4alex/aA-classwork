class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
      #redirect_to        #asked if/when redirect is needed. Zach said redirect_to is a whole new request   do not render :new here after logging in a user (because they are already logged in)
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new         #render :new allows the previously entered data to still be there when the page is refreshed for them to try again
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
