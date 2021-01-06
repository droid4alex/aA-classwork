class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  def new
    @user = User.new
    render :new
  end

  def show
    #debugger
    user = User.find_by(id: params[:id])
  end

  def create
    
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user.id)
    else
      #debugger
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy      #extra - if "delete my account " button
    user = User.find_by(id: params[:id])
    logout
    #are we supposed to logout here too???
    redirect_to new_user_url #different than render :new
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end