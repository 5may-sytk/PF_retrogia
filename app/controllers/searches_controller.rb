class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range =params[:range]
    @word =params[:search]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end

  def search
    @range = params[:range]
    @word = params[:word]
  
    if @range == "User"
      @users = User.where("name LIKE ?", "%#{@word}%")
    else
      @posts = Post.where("title LIKE ?", "%#{@word}%")
    end
  end
end
