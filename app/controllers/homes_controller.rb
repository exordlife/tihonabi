class HomesController < ApplicationController

  def top
    @posts=Post.all.order(id: "DESC").limit(10)
  end
end
