class ReviewsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.profile), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_reviews
    @reviews = Review.where(review_by_id: current_user.id)
  end

  def create
    @album = Album.find(params[:album_id])
    @review = @album.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @album, notice: 'Review was successfully created.' }
        format.js   # This will look for create.js.erb
      else
        format.html { render :new }
        format.js   { render :new }
      end
    end
  end



  private

  def set_review
    @review = Review.find(params[:id])
  end

    def review_params
      params.require(:review).permit(:album_id, :review, :rate)
    end

end
