json.extract! review, :id, :album_id, :review, :rate, :review_by_id, :created_at, :updated_at
json.url review_url(review, format: :json)
