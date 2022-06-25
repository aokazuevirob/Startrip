class Public::GenresController < ApplicationController

  def index
    @parents = Genre.where(ancestry: nil)
  end

  def show
    @reviews = Review.where(status: :published).order('id DESC')
  end

end
