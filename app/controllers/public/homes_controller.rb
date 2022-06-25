class Public::HomesController < ApplicationController
  def top
    @reviews = Review.where(status: :published).order('id DESC')
  end

  def about
  end
end
