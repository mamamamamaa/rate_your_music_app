json.extract! album, :id, :title, :release_date, :average_rating, :rated, :language, :external_link, :description, :posted_by_id, :created_at, :updated_at
json.url album_url(album, format: :json)
