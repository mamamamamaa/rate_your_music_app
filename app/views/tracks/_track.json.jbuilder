json.extract! track, :id, :title, :length, :artist_id, :genre_id, :album_id, :created_at, :updated_at
json.url track_url(track, format: :json)
