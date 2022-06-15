class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image
  has_one_attached :user_bg_image
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy

 # フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # user画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :nickname, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, {length: {maximum: 50}}

  enum gender: { male: 0, female: 1, no_answer: 2}

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'defult-image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_user_bg_image(width, height)
    unless user_bg_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image1.jpg')
      user_bg_image.attach(io: File.open(file_path), filename: 'defult-image1.jpg', content_type: 'image/jpeg')
    end
    user_bg_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # followした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # followを外す時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

end
