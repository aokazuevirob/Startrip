class CreateReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tags do |t|

      t.integer :review_id, foreign_key: true
      t.integer :tag_id, foreign_key: true
      t.timestamps
    end

    # 同じタグを重複して保存させない
    add_index :review_tags, [:review_id, :tag_id], unique: true
  end
end
