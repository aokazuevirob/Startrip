class Admin::GenresController < ApplicationController

  def index
    # 多段階カテゴリーの親要素
    @parents = Genre.where(ancestry: nil)
  end

end
