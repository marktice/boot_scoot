class ContactMailer < ApplicationMailer
  def send_contact_email(user_info)
    @user = user_info[:user] #current_user (object)
    params = user_info[:params] # hash params
    @name = params[:name] # from input field name
    @message = params[:message] # from input field message
    
    email = ENV.fetch('SYSTEM_EMAIL')
    
    date = Time.now.strftime("%B %d, %Y, %A")
    subject = "New user message #{date}"
    
    mail(to: email, subject: subject)
  end
end
