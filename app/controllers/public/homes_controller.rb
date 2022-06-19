class Public::HomesController < ApplicationController
  def top
    @countries = Country.order('id DESC').limit(4)
  end

  def about
  end
end
