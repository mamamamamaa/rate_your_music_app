class AlbumsController < InheritedResources::Base

  def index
    @albums = Album.all

    if params[:search].present?
      @albums = @albums.where("title ILIKE ?", "%#{params[:search]}%")
    end

    if params[:sort].present?
      direction = params[:direction] == "desc" ? "desc" : "asc"
      case params[:sort]
      when "title"
        @albums = @albums.order("title #{direction}")
      when "release_date"
        @albums = @albums.order("release_date #{direction}")
      when "average_rating"
        @albums = @albums.order("average_rating #{direction}")
      when "rated"
        @albums = @albums.order("rated #{direction}")
      end
    end
  end

  def create
    @album = Album.new(album_params)
    @album.posted_by_id = current_user.id

    if @album.save
      redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end
  def destroy
    @album.destroy!
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist_id, :release_date, :average_rating, :rated, :language, :external_link, :description, :avatar)
  end

end
