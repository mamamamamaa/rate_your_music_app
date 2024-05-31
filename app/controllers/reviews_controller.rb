class ReviewsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all

    if params[:sort].present?
      direction = params[:direction] == "desc" ? "asc" : "desc"
      case params[:sort]
      when "album"
        @reviews = @reviews.joins(:album).order("albums.title #{direction}")
      when "rate"
        @reviews = @reviews.order("rate #{direction}")
      end
    end
  end

  def destroy
    @album = @review.album
    @review.destroy

    respond_to do |format|
      format.html { redirect_to profile_path(current_user.profile), notice: "Review was successfully destroyed." }
      format.js  
    end
  end

  def my_reviews
    @reviews = Review.where(review_by_id: current_user.id)
  end

  def create
    @album = Album.find(params[:album_id])
    @review = @album.reviews.build(review_params)
    @review.review_by_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @album, notice: "Review was successfully created." }
        format.js
      else
        format.html { render :new }
        format.js   { render :new }
      end
    end
  end

  def update_album_rating(album)
    reviews = album.reviews
    album.average_rating = reviews.average(:rate) || 0.0
    album.rated = reviews.size
    album.save
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

    def review_params
      params.require(:review).permit(:album_id, :review, :rate)
    end

end
