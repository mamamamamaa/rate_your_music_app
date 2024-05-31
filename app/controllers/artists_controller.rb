class ArtistsController < InheritedResources::Base

  def index
    @artists = Artist.all

    if params[:search].present?
      @artists = @artists.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:sort].present?
      direction = params[:direction] == "desc" ? "asc" : "desc"
      case params[:sort]
      when "label"
        @artists = @artists.joins(:label).order("labels.name #{direction}")
      end
    end
  end

  private

    def artist_params
      params.require(:artist).permit(:name, :label_id, :avatar)
    end

end
