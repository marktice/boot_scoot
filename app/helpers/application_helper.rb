module ApplicationHelper

  def display_errors(model, field)
    messages = []
    if model.errors[field].present?
      model.errors.full_messages_for(field).each do |message|
          messages << message
      end
      return messages.join('<br>').html_safe
    end
  end
end
