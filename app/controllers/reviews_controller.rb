class ReviewsController < ApplicationController
  def new
    @review = Review.New
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new # please explain!
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
