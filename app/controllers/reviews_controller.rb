class ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    booking = Booking.find(params[:booking_id])
    @passenger = booking.passenger
    @driver = booking.driver
    @review = booking.reviews.build
  end

  def create
    booking = Booking.find(params[:booking_id])
    passenger = booking.passenger
    driver = booking.driver

    @review = booking.reviews.build(review_params)
    @review.reviewer = current_user

    # set reviewee to other user of booking
    if current_user == passenger
      @review.reviewee = driver  
    elsif current_user == driver
      @review.reviewee = passenger
    end

    if @review.save!
      flash[:success] = 'Review submitted, thankyou for your feedback'
      redirect_to root_path
    else
      flash.now[:danger] = 'Could not submit review'
      render 'new'
    end

  end


  private
  def review_params
    params.require(:review).permit([
      :rating, 
      :content
    ])
  end
end