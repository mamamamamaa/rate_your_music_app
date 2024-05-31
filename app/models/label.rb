class Label < ApplicationRecord
  has_one_attached :avatar
  has_many :artists, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["artists"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
