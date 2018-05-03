class DriverProfile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:transport_image)
end
