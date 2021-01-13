class PostsController < ApplicationController
    before_action :require_logged_in

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        @subs = Sub.all
        render :new
    end

    def create
        #debugger
        @post = Post.new(post_params)
        @subs = Sub.all
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = current_user.authored_posts.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end
end

