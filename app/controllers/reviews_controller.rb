class ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])

    authorize @review
  end

  def new
    booking = Booking.find(params[:booking_id])
    
    # complete booking
    if booking.completed_at.nil?
      booking.completed_at = Time.now
      booking.status = "Booking completed"
      if booking.save!
        flash.now[:success] = "Booking completed, review your trip"
      else
        flash[:danger] = "Could not complete booking"
        redirect_back fallback_location: root_path
      end
    end

    @passenger = booking.passenger
    @driver = booking.driver
    @review = booking.reviews.build

    # authorize
    # puts @review
    # puts @review.booking
    # puts @review.booking.driver.email
    # puts @review.booking.passenger.email
    # puts current_user.email
    authorize @review
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

    #authorize
    # puts @review
    # puts @review.booking
    # puts @review.booking.driver.email
    # puts @review.booking.passenger.email
    # puts current_user.email
    # authorize @review

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