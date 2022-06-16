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
    greater_than_or_equal_to: 1}, presence: true

  def get_travel_image
    (travel_image.attached?) ? travel_image : 'no_image1.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def country
    Carmen::Country.coded(country_code, departure)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :country_id, :country_code, :departure, :area, :rate, :title, :body, :travel_cost, :accommodation_fee, :night, :travel_images)
  end

end
