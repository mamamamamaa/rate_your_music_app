class Track < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  belongs_to :genre
end
