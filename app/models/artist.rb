class Artist < ApplicationRecord
  has_one_attached :avatar
  belongs_to :label
  has_many :albums
  has_many :tracks

  validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["albums", "label", "tracks"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "label_id", "name", "updated_at", "avatar_attachment_id_eq", "avatar_blob_id_eq", "avatar_cont", "avatar_eq", "avatar_start", "avatar_end"]
  end

end
