class UsersController < ApplicationController
  
  def show
    @user=User.find(params[:id])
    @posts=@user.posts
  end
  
  def edit
    @user=current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] ="更新しました"
    redirect_to user_path(current_user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
