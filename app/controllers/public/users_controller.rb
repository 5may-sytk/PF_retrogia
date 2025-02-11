class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to public_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to public_user_path(current_user.id)
    else
      flash.now[:notice] = "更新に失敗しました。"
      render :edit
    end
    
  end

  def leave
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会が完了しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:user_image,  :name, :introduction, :is_public)
  end
end
