class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    
    # ガード節でユーザーの検索ではない場合はポストの検索を実施
    if @range != "User"
      @posts = Post.where("title LIKE ?", "%#{@word}%")
      return
    end
  
    # ユーザー情報の検索
    if @word.present?
      if @word.match(/\A[a-zA-Z0-9]{10}\z/)
        @users = User.where(unique_id: @word)
      else
        @users = User.where("name LIKE ?", "%#{@word}%")
      end
    else
      @users = User.all
    end
  end