class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id]) 
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id 
    @post_comment.save
    redirect_to public_post_post_comment_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
