class Genre < ApplicationRecord
  has_many :tracks
  has_and_belongs_to_many :profiles

  def self.ransackable_associations(auth_object = nil)
    ["profiles", "tracks"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
