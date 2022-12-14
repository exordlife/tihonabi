class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user=User.find(params[:id])
    @genres=Genre.all
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    #if params[:genre_id] # 検索したいジャンルのidがあるなら...
      #@genre = Genre.find(params[:genre_id]) # ジャンルを検索する
      #@posts = @genre.posts.where(user_id: current_user.id)# ジャンルに紐づく投稿を全て取得する。
      #@genre_post=@posts
      # 上記の2行を以下の様に1行でも書くことができます。
      # @posts = Post.where(genre_id: params[:genre_id])
    #else
    @posts=@user.posts.order("created_at DESC")

    #end
  end

  def edit
    @user_id=User.find(params[:id])
    if @user_id != current_user
      redirect_to user_path(current_user)
    end
    @user=current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice1] ="更新しました"
    redirect_to user_path(current_user)
  end

  def yourheart
    @user=current_user
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def kisekae
    @user=current_user
    redirect_to user_path(current_user)
    if @user.back==1
      current_user.update(back: 2)
    elsif
      current_user.update(back: 1)
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
