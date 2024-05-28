class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :length
      t.integer :artist_id
      t.integer :genre_id
      t.integer :album_id

      t.timestamps
    end
  end
end
