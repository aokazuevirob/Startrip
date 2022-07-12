class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image
  has_one_attached :user_bg_image
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :review_comments, dependent: :destroy

 # フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # user画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :nickname, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, {length: {maximum: 200}}

  enum gender: { male: 0, female: 1, no_answer: 2}

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_user_bg_image(width, height)
    unless user_bg_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image1.jpg')
      user_bg_image.attach(io: File.open(file_path), filename: 'default-image1.jpg', content_type: 'image/jpeg')
    end
    user_bg_image.variant(resize_to_limit: [width, height]).processed
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(last_name: 'guest', first_name: 'user', nickname: 'ゲスト', email: 'guest@example.com', phone_number: '11111111111', gender: 'no_answer', birth_date: '1995-01-01') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "guest"
      user.first_name = "user"
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

  def self.looks(search, word)
    if search == "partial_match"
      @user = User.where("last_name LIKE?","%#{word}%").or(User.where("first_name LIKE?", "%#{word}%").or(User.where("nickname LIKE?", "%#{word}%")))
    elsif search == "perfect_match"
      @user = User.where("last_name LIKE?", "#{word}").or(User.where("first_name LIKE?", "#{word}").or(User.where("nickname LIKE?", "#{word}")))
    else
      @user = User.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :phone_number, :gender, :birth_date, :is_deleted, :introduction, :user_image, :user_bg_image)
  end

end
