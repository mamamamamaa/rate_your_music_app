class Label < ApplicationRecord
  has_many :artists

  def self.ransackable_associations(auth_object = nil)
    ["artists"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
