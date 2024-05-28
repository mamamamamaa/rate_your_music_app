class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :release_date
      t.decimal :average_rating
      t.decimal :rated
      t.string :language
      t.string :external_link
      t.text :description
      t.integer :posted_by_id

      t.timestamps
    end
  end
end
