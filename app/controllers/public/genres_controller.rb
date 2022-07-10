class Public::GenresController < ApplicationController

  # 多段階カテゴリーによる親要素の定義
  def index
    @parents = Genre.where(ancestry: nil)
  end

  def show
    @reviews = Review.where(status: :published).order('id DESC')
  end

end
