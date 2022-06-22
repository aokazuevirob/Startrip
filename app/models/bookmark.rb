class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :review

  # ロード中に重複して登録することを防ぐ
  validates :user_id, uniqueness: { scope: :review_id }
end
