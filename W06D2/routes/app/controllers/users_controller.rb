class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # not so sure about what this is supposed to do 
  def new
    new_user = User.new(name: params[:name], email: params[:email])
    render json: new_user
  end



  def show
    render json: User.find(params[:id])
  end



  def update

    update_user = User.find_by(id: params[:id])
    debugger

    if update_user
      update_user.update(params.require(:user).permit(:name, :email))
    else
      render json: "not found"
    end
  end



  def destroy
    User.find(params[:id]).delete
  end


end
