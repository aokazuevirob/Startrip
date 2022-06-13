class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id
      t.integer :country_id
      t.string :area
      t.float :rate
      t.text :body
      t.integer :travel_cost
      t.integer :accommodation_fee
      t.integer :night
      t.timestamps
    end
  end
end
