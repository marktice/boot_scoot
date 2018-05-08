class Car < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:car_image)

  validates :make, :model, :number_plate, presence: true

  validates :transmission, presence: true, 
            inclusion: { in: %w(auto manual) }
end