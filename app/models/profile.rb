class Profile < ApplicationRecord
  belongs_to :user

  include ImageUploader::Attachment.new(:avatar_image)

  geocoded_by :home_address
  after_validation :geocode

  def average_passenger_rating
    ratings=[]
    self.user.passenger_bookings.each do |booking|
      unless booking.reviews == nil || booking.reviews.find_by(reviewee: self.user) == nil
        ratings << booking.reviews.find_by(reviewee: self.user).rating
      end
    end
    sum_ratings = ratings.sum.to_f
    ave_rating = sum_ratings / ratings.length
  end

  # need 
  def average_driver_rating
    ratings=[]
    self.user.driver_bookings.each do |booking|
      unless booking.reviews == nil || booking.reviews.find_by(reviewee: self.user) == nil
        ratings << booking.reviews.find_by(reviewee: self.user).rating
      end
    end
    sum_ratings = ratings.sum.to_f
    ave_rating = sum_ratings / ratings.length
  end
end