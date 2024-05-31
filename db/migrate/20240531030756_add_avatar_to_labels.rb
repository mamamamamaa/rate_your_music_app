class AddAvatarToLabels < ActiveRecord::Migration[7.1]
  def change
    add_column :labels, :avatar, :string
  end
end
