class Genre < ApplicationRecord

  has_many :countries, dependent: :destroy
  has_ancestry

end
