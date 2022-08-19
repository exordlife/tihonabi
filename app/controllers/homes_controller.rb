class HomesController < ApplicationController

  def top
    @posts=Post.all.order(id: "DESC").limit(12)
    gon.posts=Post.all
    @favorite_sort=Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(12).pluck(:post_id))
  end
end
