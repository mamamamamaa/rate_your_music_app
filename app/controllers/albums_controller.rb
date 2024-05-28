class AlbumsController < InheritedResources::Base

  private

  def album_params
    params.require(:album).permit(:title, :artist_id, :release_date, :average_rating, :rated, :language, :external_link, :description)
  end

end
