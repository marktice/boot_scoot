class BookingsController < ApplicationController

  def index
    @bookings = Booking.order('created_at ASC')  

    @locations = []
    Booking.all.each do |booking|
      unless booking.origin.nil?
      @locations.push({
        lat: booking.origin.latitude,
        lng: booking.origin.longitude,
        name: booking.passenger.profile.first_name
      })
      end
    end
    # puts @locations
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  def new
    @booking = Booking.new
  end

  def create
    if current_user.car == nil
      redirect_to car_edit_path
      flash[:danger] = 'You require a car to make a booking'
    else      
      @booking = Booking.new(booking_params)

      # create and add locations
      @booking.origin = Location.create(address: booking_params[:origin_address])
      @booking.destination = Location.create(address: booking_params[:destination_address])
      # passenger creates bookings
      @booking.passenger = current_user

      # calculate and set distance and cost
      @booking.distance = @booking.origin.distance_from(@booking.destination.to_coordinates)
      @booking.cost = 8.50 + @booking.distance * 2.75
      
      if @booking.save!
        flash[:success] = 'Booking created, looking for a driver'
        redirect_to @booking
      else
        flash.now[:danger] = 'Could not create booking'
        render :new
      end
      
    end
  end

  # def edit
  #   @booking = Booking.new(booking_params)
  # end

  def update
    @booking = Booking.find(params[:id])
    # driver accepts and updates booking
    @booking.driver = current_user
    @booking.status = "Driver on his way"
    if @booking.save!
      flash[:success] = "Booking accepted, goto pickup location"
      redirect_to @booking
    else
      flash[:danger] = "Could not accept booking"
      redirect_to bookings_path
    end
  end

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