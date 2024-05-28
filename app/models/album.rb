class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks
  has_many :reviews

  validates :artist_id, presence: true
end
