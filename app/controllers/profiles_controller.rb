class ProfilesController < InheritedResources::Base
  before_action :set_profile, only: %i[show edit update destroy add_favorite_genre]  # GET /profiles/1
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # PATCH/PUT /profiles/1
  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    user = @profile.user
    @profile.destroy
    user.destroy
    redirect_to profiles_url, notice: "Profile was successfully deleted."
  end

  def add_favorite_genre
    genre_id = params[:genre_id].to_i
    unless @profile.favorite_genres.include?(genre_id)
      @profile.favorite_genres << genre_id
      @profile.save
    end
    redirect_to @profile, notice: "Genre was successfully added."
  end

  private

  def set_profile
    @profile = Profile.find_by(id: params[:id])
    return unless @profile.nil?
    redirect_to root_path, alert: "Profile not found."
  end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, favorite_genres: [])
    end

end
