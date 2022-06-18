class Country < ApplicationRecord

  has_one_attached :flag_image
  has_one_attached :country_image
  has_many :reviews, dependent: :destroy
  belongs_to :genre

  def get_flag_image
    (flag_image.attached?) ? flag_image : 'no_image2.jpg'
  end

  def get_country_image
    (country_image.attached?) ? country_image : 'no_image3.jpg'
  end

end
