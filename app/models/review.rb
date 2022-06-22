class Review < ApplicationRecord

  has_one_attached :travel_image
  has_many :review_tags, dependent: :destroy
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

  def save_tag(sent_tags)
    # tagの存在を確認して、存在しているtagの名前を全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 取得したtagの中から投稿で送信されたtagを除いたものを不要なtagとする
    old_tags = current_tags - sent_tags
    # 投稿で送信されたtagの中から取得したtagを除いたものを新規tagとする
    new_tags = sent_tags - current_tags

    # 不要なtagは削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    # 新規tagを保存
    new_tags.each do |new|
      new_review_tag = Tag.find_or_create_by(name: new)
      self.tags << new_review_tag
    end
  end

end