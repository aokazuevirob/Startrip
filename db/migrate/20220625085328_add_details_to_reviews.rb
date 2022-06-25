class AddDetailsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :lat, :float
    add_column :reviews, :lng, :float
  end
end
