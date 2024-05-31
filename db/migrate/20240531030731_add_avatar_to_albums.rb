class AddAvatarToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :avatar, :string
  end
end
