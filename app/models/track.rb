class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  belongs_to :genre

  def self.ransackable_attributes(auth_object = nil)
    ["album_id", "artist_id", "created_at", "genre_id", "id", "id_value", "length", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["album", "artist", "genre"]
  end
end
