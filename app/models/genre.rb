class Genre < ApplicationRecord

  has_many :country, dependent: :destroy
  has_ancestry

end
