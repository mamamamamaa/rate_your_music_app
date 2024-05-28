class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks
  has_many :reviews

  validates :artist_id, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["artist", "reviews", "tracks"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["artist_id", "average_rating", "created_at", "description", "external_link", "id", "id_value", "language", "posted_by_id", "rated", "release_date", "title", "updated_at"]
  end
end
