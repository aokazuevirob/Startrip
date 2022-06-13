class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy

 # フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # user画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, {length: {maximum: 50}}
  
  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
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
