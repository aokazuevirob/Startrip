class Admin::GenresController < ApplicationController

  def index
    @parents = Genre.where(ancestry: nil)
  end

end
