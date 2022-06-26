class Admin::HomesController < ApplicationController

  def top
    @reviews = Review.where(status: :published).order('id DESC')
  end

end
