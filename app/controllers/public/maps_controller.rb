class Public::MapsController < ApplicationController

  def index
    @reviews = Review.where(status: :published).order('id DESC')
  end

end
