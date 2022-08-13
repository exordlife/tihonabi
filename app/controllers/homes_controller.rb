class HomesController < ApplicationController

  def top
    @posts=Post.all.order(id: "DESC").limit(7)
    gon.posts=Post.all
  end
end
