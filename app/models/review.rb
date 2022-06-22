class Review < ApplicationRecord

  has_one_attached :travel_image
  has_many :review_tag, dependent: :destroy
  has_many :tags, through: :review_tags
  has_many :favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  # 5段階評価の範囲指定
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5}, presence: true

  # 宿泊日数の選択
  enum night: { one_night: 0, two_night: 1, three_night: 2, four_night: 3, five_night: 4, six_night: 5, seven_night: 6}
  # 投稿範囲の選択
  enum status: { published: 0, unpublished: 1, draft: 2}

  def get_travel_image(width, height)
    unless travel_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image1.jpg')
      travel_image.attach(io: File.open(file_path), filename: 'default-image1.jpg', content_type: 'image/jpeg')
    end
    travel_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def bookmarked_by?(user)
    # bookmarkされていないか
    bookmarks.where(user_id: user).exists?
  end

  def travel_country
    Carmen::Country.coded(country_code)
  end

  def departure_country
    Carmen::Country.coded(departure)
  end


end
