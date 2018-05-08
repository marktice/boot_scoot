class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:avatar_image)

  geocoded_by :home_address
  after_validation :geocode

  validates :first_name, :last_name, :sex, presence: true

  validates :home_address, presence: true

  validates :phone_number, presence: true,
            numericality: true,
            length: { minimum: 10, maximum: 15 }
end