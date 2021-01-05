class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  def new
    @user = User.new(user_params)
    render :new
  end

  def show
    user = User.find_by_credentials(user_params)
  end

  def create
    user = User.new(user_params)
    if user.save!
      redirect_to users_url(user.id)
    else
      #error
      render :new
    end
  end

  def destroy      #extra
    user = User.find_by_credentials(user_params)
    user.destroy
    #redirect_to 
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end