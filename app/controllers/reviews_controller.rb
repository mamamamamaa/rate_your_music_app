class ReviewsController < InheritedResources::Base
  def my_reviews
    @reviews = current_user.reviews
  end

  def create
    @review = current_user.reviews.build(review_params.merge(review_by_id: current_user.id))
    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
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
