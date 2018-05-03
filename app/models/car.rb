class Car < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:car_image)
end