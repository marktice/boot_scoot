class ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    booking = Booking.find(params[:booking_id])
    @review = booking.reviews.build
  end

  def create
    booking = Booking.find(params[:booking_id])
    @review = booking.reviews.build(review_params)
    
    @review.reviewer = current_user

    # set reviewee to other user of booking
    if current_user == booking.passenger
      @review.reviewee = booking.driver  
    elsif current_user == booking.driver
      @review.reviewee = booking.passenger
    end

    if @review.save!
      flash[:success] = 'Review submitted, thanks for your feedback'
      redirect_to root_path
    else
      flash.now[:danger] = 'Could not save review'
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