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
        @post_comment = PostComment.new
        gon.post=@post
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            @exp=current_user.exp_sum
            @exp=@exp+(0.9**@exp)
            current_user.update(exp_sum: @exp)
          redirect_to post_path(@post)
        else
          flash[:notice1] = '※画像を選択してください'
          @new_post=Post.new
          redirect_to new_post_path
        end

    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to user_path(current_user)
    end

    private
    def post_params
        params.require(:post).permit(:content, :genre_id ,:address, :latitude, :longitude, image: [])
    end
end
