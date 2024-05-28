class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_and_belongs_to_many :genres

  def self.ransackable_attributes(auth_object = nil)
    ["avatar", "created_at", "favorite_genres", "first_name", "id", "id_value", "last_name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["avatar_attachment", "avatar_blob", "genres", "user"]
  end
end

