class Admin::CountriesController < ApplicationController
  def new
    @country = Country.new
    @genres = Genre.all
  end

  def index
  end

  def show
  end

  def edit
  end
end
