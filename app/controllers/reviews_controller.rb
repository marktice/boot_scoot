class ReviewsController < ApplicationController
  
  # do i need this?? why need to show a review, what circumstance
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
    @review = booking.reviews.build
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

    #authorize WONT WORK WHEN PRESSING BACK>!>!>
    # puts @review
    # puts @review.booking
    # puts @review.booking.driver.email
    # puts @review.booking.passenger.email
    # puts current_user.email
    # authorize @review

    if @review.save
      # if <= 2 redirect to contact form
      if @review.rating >= 3
        flash[:success] = 'Review submitted, thankyou for your feedback'
        redirect_to new_booking_path
      else
        flash[:notice] = 'Did something go wrong? Let us know how we can help'
        redirect_to contact_path
      end

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