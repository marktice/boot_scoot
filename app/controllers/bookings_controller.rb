class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(driver: nil).where.not(payed_at: nil)
    if current_user.driver_profile.nil?
      redirect_to driver_edit_path
      flash[:danger] = 'Apply to be a driver to accept bookings'
    else
    # pass all origin locations for bookings where no driver
      @locations = []
      @bookings.each do |booking|
        unless booking.origin.nil?
        @locations.push({
          lat: booking.origin.latitude,
          lng: booking.origin.longitude,
          name: booking.passenger.profile.first_name
        })
        end
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    # authorize user either booking passenger or driver
    authorize @booking
  end
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if current_user.car.nil?
      redirect_to car_edit_path
      flash[:danger] = 'You require a car to make a booking'
    else
      # create and add locations
      @booking.origin = Location.create(address: booking_params[:origin_address])
      @booking.destination = Location.create(address: booking_params[:destination_address])
      # passenger creates bookings
      @booking.passenger = current_user
      # calculate and set distance and cost
      @booking.distance = @booking.origin.distance_from(@booking.destination.to_coordinates)
      @booking.cost = 8.50 + @booking.distance * 2.75
      @booking.status = 'Booking created, pending payment'
      if @booking.save
        flash[:success] = 'Booking created, confirm to pay'
        redirect_to @booking
      else
        flash.now[:danger] = 'Could not create booking'
        render :new
      end
    end
  end

  # dont use atm
  # def edit
  #   @booking = Booking.new(booking_params)
  # end

  # POST /bookings/1/charge
  def charge
    @booking = Booking.find(params[:id])

    if current_user.stripe_charge_id.blank?
      customer = Stripe::Customer.create(
        email:  params[:stripeEmail],
        source: params[:stripeToken]
      )
      # set user stripe_charge_id to the customer id retrieved from stripe
      current_user.stripe_charge_id = customer.id
      current_user.save! #bad, doesn't handle error
    end
    
    charge = Stripe::Charge.create(
      customer:     current_user.stripe_charge_id,
      amount:       @booking.cost_in_cents.to_i,
      description:  "Boot Scoot",
      currency:     'aud'
    )

    # update booking
    @booking.payed_at = Time.now
    @booking.status = "Payment received, looking for driver"
    @booking.save! #bad, doesn't handle error

    flash[:success] = 'Payment made'
    redirect_to @booking
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_back fallback_location: bookings_path

  end

  def update
    @booking = Booking.find(params[:id])
    # driver accepts and updates booking
    @booking.driver = current_user
    @booking.status = "Driver found, on his way to pickup location"
    if @booking.save
      flash[:success] = "Booking accepted, make your way to the pickup location"
      redirect_to @booking
    else
      flash[:danger] = "Could not accept booking"
      redirect_to bookings_path
    end
  end

  # currently not used
  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:success] = "Booking Destroyed"
      redirect_to root_path
    else
      flash[:danger] = "Could not destroy booking"
      redirect_to root_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit([
      :origin_address,
      :destination_address
    ])
  end
end