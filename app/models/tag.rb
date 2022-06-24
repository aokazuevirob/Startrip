class Tag < ApplicationRecord

  has_many :review_tags, dependent: :destroy, foreign_key: 'tag_id'
  # tagの投稿はreview_tagを経由して参照
  has_many :reviews, through: :review_tags

  validates :name, uniqueness: true, presence: true

end
