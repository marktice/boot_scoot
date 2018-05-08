class DriverProfile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:transport_image)

  validates :drivers_licence, presence: true
  
  validates :transport_type, presence: true,
            inclusion: { in: ['small/foldable scooter', 'foldable bike', 'skateboard', 'segway', 'other'] }
end