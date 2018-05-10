class CarsController < ApplicationController
  
  def show
    @car = current_user.car
  end
  
  def edit
    @car = Car.find_or_initialize_by(user: current_user)
  end
  
  def create
    @car = Car.new(car_params)
    @car.user = current_user
    
    if @car.save
      flash[:success] = "Car added to account"
      redirect_to profile_path
    else
      flash.now[:danger] = "Could not save car details"
      render 'edit'
    end
  end
  
  def update
    @car = current_user.car
    if @car.update(car_params)
      flash[:success] = "Car details updated"
      redirect_to car_path
    else
      flash.now[:danger] = "Could not update car details"
      render 'edit'
    end
  end


  private
  def car_params
    params.require(:car).permit([
      :make, 
      :model,
      :number_plate,
      :transmission,
      :car_image
    ])
  end
end