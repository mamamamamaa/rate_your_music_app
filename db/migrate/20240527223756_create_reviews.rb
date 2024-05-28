class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :album_id
      t.text :review
      t.decimal :rate
      t.integer :review_by_id

      t.timestamps
    end
  end
end
