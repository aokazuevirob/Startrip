class Review < ApplicationRecord

  has_many_attached :travel_images
  has_many :review_tag, dependent: :destroy
  has_many :tags, through: :review_tags
  has_many :favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  belongs_to :user
  belongs_to :country

  # 5段階評価の範囲指定
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5}, presence: true

  def get_travel_images(width, height)
    (travel_images.attached?) ? travel_images : 'no_image1.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def travel_country
    Carmen::Country.coded(country_code)
  end

  def departure_country
    Carmen::Country.coded(departure)
  end


end
