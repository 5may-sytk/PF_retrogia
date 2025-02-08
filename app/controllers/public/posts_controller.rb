class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save!
      redirect_to public_posts_path
    else
      flash.now[:notice] = "登録に失敗しました。"
      render :new
    end
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_user_path(current_user.id)
    else
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    post.destroy
    redirect_to public_user_path(current_user.id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :contents, :address, :latitude, :longitude, :visited_at,
    # :tags, 
    :visibility, :post_image)
  end
end
