class DriverProfilesController < ApplicationController
  
  def show
    @driver_profile = current_user.driver_profile
  end
  
  def edit
    @driver_profile = DriverProfile.find_or_initialize_by(user: current_user)
  end
  
  def create
    @driver_profile = DriverProfile.new(driver_profile_params)
    @driver_profile.user = current_user
    
    if @driver_profile.save
      flash[:success] = "Driver profile added. Await approval."
      redirect_to profile_path
    else
      flash.now[:danger] = "Could not save driver details"
      render 'edit'
    end
  end
  
  def update
    @driver_profile = current_user.driver_profile
    if @driver_profile.update(driver_profile_params)
      flash[:success] = "Driver details updated"
      redirect_to profile_path
    else
      flash.now[:danger] = "Could not update driver details"
      render 'edit'
    end
  end


  private
  def driver_profile_params
    params.require(:driver_profile).permit([
      :drivers_licence, 
      :transport_type,
      :transport_image
    ])
  end
end