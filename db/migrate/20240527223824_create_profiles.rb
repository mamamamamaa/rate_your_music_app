class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.integer :user_id

      t.timestamps
    end
  end
end
