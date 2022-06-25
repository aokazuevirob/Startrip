class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Review"
      @reviews = Review.looks(params[:search], params[:word])
    else
      @users = User.looks(params[:search], params[:word])
    end
  end

end
