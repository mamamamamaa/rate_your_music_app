class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :label_id

      t.timestamps
    end
  end
end
