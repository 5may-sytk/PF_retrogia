class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range =params[:range]
    @word =params[:search]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Psst.looks(params[:search], params[:word])
    end
  end
end
