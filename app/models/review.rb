class Review < ApplicationRecord
  belongs_to :album
  belongs_to :user, foreign_key: "review_by_id"

  validates :rate, presence: true, inclusion: { in: 1..5 }
  validates :review, presence: true

  after_save :update_album_ratings

  def self.ransackable_attributes(auth_object = nil)
    ["album_id", "created_at", "id", "id_value", "rate", "review", "review_by_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["album", "user"]
  end

  private

  def update_album_ratings
    album.update_ratings
  end
end

