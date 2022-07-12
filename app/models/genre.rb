class Genre < ApplicationRecord

  has_many :countries, dependent: :destroy
  # 多段階カテゴリーのアソシエーション
  has_ancestry

end
