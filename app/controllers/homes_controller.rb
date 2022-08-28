class HomesController < ApplicationController

  def top
    gon.posts=Post.all
    @favorite_sort=Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(12).pluck(:post_id))
    if user_signed_in?
      gon.user=current_user.id
    end
    if params[:genre_id] # 検索したいジャンルのidがあるなら...
      @genre = Genre.all.find(params[:genre_id]) # ジャンルを検索する
      @post=Post.all.order(id: "DESC").limit(12)
      @posts= @post.select{ |post| post.genre_id == @genre.id }
      # 上記の2行を以下の様に1行でも書くことができます。
      # @posts = Post.where(genre_id: params[:genre_id])
    else

      @posts=Post.all.order(id: "DESC").limit(12)
    end

  end
end
