class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.user = current_user
    @review.booking = @booking
    if @review.save
      redirect_to studio_path(@booking.room.studio)
    else
      render "bookings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
