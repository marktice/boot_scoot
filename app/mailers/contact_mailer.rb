class ContactMailer < ApplicationMailer
  def send_contact_email(email_info)
    @user = email_info[:user]
    @contact_reason = email_info[:contact_reason]
    @booking = email_info[:booking]
    @message = email_info[:message]

    email = ENV.fetch('SYSTEM_EMAIL')
    
    date = Time.now.strftime("%B %d, %Y, %A")
    subject = "New user message #{date}"
    mail(to: email, subject: subject)
  end
end