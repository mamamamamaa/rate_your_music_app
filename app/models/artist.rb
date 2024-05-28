class Artist < ApplicationRecord
  belongs_to :label
  has_many :albums
  has_many :tracks

  validates :name, presence: true
end
