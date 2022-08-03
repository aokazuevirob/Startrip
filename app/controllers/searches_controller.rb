class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Review"
      @reviews = Review.looks(params[:search], params[:word]).published.order('id DESC')
    else
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(8)
    end
  end

end
