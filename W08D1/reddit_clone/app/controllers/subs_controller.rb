class SubsController < ApplicationController
  before_action :require_logged_in, only: [:edit, :update]

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id]) #would be nil if sub is not found
    if @sub.update(params.require(:sub).permit(:title, :description))
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ['You need to be moderator to update this sub']
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def index
    @subs = Sub.all 
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params.require(:sub).permit(:title, :description))
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

end
