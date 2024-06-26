class Album < ApplicationRecord
  has_one_attached :avatar
  belongs_to :artist
  has_many :tracks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :artist_id, presence: true

  def update_ratings
    self.rated = reviews.count
    self.average_rating = reviews.average(:rate).to_f
    save
  end

  def self.ransackable_associations(auth_object = nil)
    ["artist", "reviews", "tracks"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["artist_id", "average_rating", "created_at", "description", "external_link", "id", "id_value", "language", "posted_by_id", "rated", "release_date", "title", "updated_at", "avatar_attachment_id_eq", "avatar_blob_id_eq", "avatar_cont", "avatar_eq", "avatar_start", "avatar_end"]
  end
end
