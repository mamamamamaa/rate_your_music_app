class ArtistsController < InheritedResources::Base

  private

    def artist_params
      params.require(:artist).permit(:name, :label_id)
    end

end
