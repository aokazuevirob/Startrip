class Tag < ApplicationRecord

  has_many :review_tags, dependent: :destroy, foreign_key: 'tag_id'
  # tagの投稿はreview_tagを経由して参照
  has_many :reviews, through: :review_tags

  validates :name, uniqueness: true, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @tag = Tag.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @tag = Tag.where("name LIKE?","%#{word}%")
    else
      @tag = Tag.all
    end
  end

end
