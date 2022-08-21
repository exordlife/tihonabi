class HomesController < ApplicationController

  def top
    @posts=Post.all.order(id: "DESC").limit(12)
    gon.posts=Post.all
    if user_signed_in?
      gon.user=current_user.id
    end
    @favorite_sort=Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(12).pluck(:post_id))
  end
end
