class Review < ApplicationRecord
  belongs_to :album
  belongs_to :user, foreign_key: "review_by_id"
end

