class PostsController < ApplicationController

    
    def index
        @posts = Post.search(params[:keyword])
        @keyword = params[:keyword]
        render "index"
    end
    
    def new
        @new_post=Post.new
    end

    def show
        @post=Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to user_path(current_user)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :genre_id, image: [])
    end
end
