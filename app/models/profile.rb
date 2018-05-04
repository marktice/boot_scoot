class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:avatar_image)

  geocoded_by :home_address
  after_validation :geocode

end