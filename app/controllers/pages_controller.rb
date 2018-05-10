class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def contact
    @bookings = (Booking.where(passenger: current_user).or(Booking.where(driver: current_user))).order("created_at DESC")
  end

  def contact_email
    email_info = {
      user: current_user, 
      contact_reason: email_params[:contact_reason],
      booking: email_params[:booking],
      message: email_params[:message]
    }

    if ContactMailer.send_contact_email(email_info).deliver_now
      flash[:success] = "Message sent, thanks for your feedback!"
      redirect_to root_path
    else
      flash.now[:danger] = "Your message could not be sent"
      render :contact
    end
  end

  private
  def email_params
    params.require(:contact).permit(:contact_reason, :booking, :message)
  end
end
