class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(current_user.id)
  end

  private
  def user_params
    params.require(:post).permit(:user_image, :user_hd_image, :name, :introduction, :public_at)
  end
end
