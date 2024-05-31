class ChangeRatedToIntegerInAlbums < ActiveRecord::Migration[7.1]
  def change
    change_column :albums, :rated, :integer
  end
end
