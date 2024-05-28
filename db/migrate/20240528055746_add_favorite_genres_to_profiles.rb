class AddFavoriteGenresToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :favorite_genres, :text, array: true, default: []
  end
end
