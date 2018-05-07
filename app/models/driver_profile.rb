class DriverProfile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:transport_image)

  validates :drivers_licence, :transport_type, presence: true
end