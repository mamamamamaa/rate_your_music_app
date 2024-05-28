class TracksController < InheritedResources::Base
  def tracks_for_you
    if user_signed_in?
      favorite_genres = current_user.profile.favorite_genres
      @tracks = Track.where(genre_id: favorite_genres).distinct
    else
      redirect_to new_user_session_path, alert: "You need to sign in first."
    end
  end

  private

    def track_params
      params.require(:track).permit(:title, :length, :artist_id, :genre_id, :album_id)
    end

end
