class AddAvatarToArtists < ActiveRecord::Migration[7.1]
  def change
    add_column :artists, :avatar, :string
  end
end
