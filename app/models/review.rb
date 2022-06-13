class Review < ApplicationRecord

  has_one_attached :travel_image
  has_many :review_tag, dependent: :destroy
  has_many :tags, through: :review_tags
  has_many :favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  belongs_to :user
  belongs_to :country

  def get_travel_image
    (travel_image.attached?) ? travel_image : 'no_image1.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
