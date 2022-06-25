class Public::CountriesController < ApplicationController

  def index
    @reviews = Review.where(status: :published).order('id DESC')
    @parents = Genre.where(ancestry: nil)
    @review = Review.new
  end

  def show
  end
end
