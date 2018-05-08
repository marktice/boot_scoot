module ApplicationHelper

  def has_reviewed?(booking)
    reviewed = false
    booking.reviews.each do |review|
      if current_user == review.reviewer
        reviewed = true
      end
    end
    reviewed
  end

  def display_errors(model, field)
    messages = []
    if model.errors[field].present?
      model.errors.full_messages_for(field).each do |message|
          messages << message
      end
      return messages.join('<br>').html_safe
    end
  end

  def display_avatar(user, size)
    if user.profile.avatar_image_data.nil?
      "avatar_image/missing.jpg"
    else
      user.profile.avatar_image_url(size)
    end
  end

end
