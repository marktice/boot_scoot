class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def contact_email
    email_info = {
      user: current_user, 
      name: email_params[:name],
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
    params.require(:contact).permit(:name, :message)
  end
end
