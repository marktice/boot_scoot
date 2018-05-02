class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    
    if @profile.save
      flash[:success] = "profile created"
      redirect_to root_path
    else
      flash.now[:danger] = "Could not save profile"
      render 'edit'
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:success] = "profile updated"
      redirect_to profile_path
    else
      flash.now[:danger] = "Could not update profile"
      render 'edit'
    end
  end


  private
  def profile_params
    params.require(:profile).permit([
      :first_name, 
      :last_name,
      :car_description
    ])
  end
end