class Car < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:car_image)

  validates :make, :model, :number_plate, :transmission, presence: true

end