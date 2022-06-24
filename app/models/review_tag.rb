class ReviewTag < ApplicationRecord

  belongs_to :review
  belongs_to :tag

  # reviewテーブルとtagテーブルの紐付けのために2つ存在させる
  validates :review_id, presence: true
  validates :tag_id, presence: true

end
