class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :car
  has_one :driver_profile

  has_many :passenger_bookings, class_name: 'Booking',  foreign_key: 'passenger_id'
  has_many :driver_bookings,    class_name: 'Booking',  foreign_key: 'driver_id'

  has_many :reviews_of,         class_name: 'Review',   foreign_key: 'reviewee_id'
  has_many :reviews_by,         class_name: 'Review',   foreign_key: 'reviewer_id'

  
  def average_passenger_rating
    ratings = []
    self.reviews_of.each do |review|
      if review.booking.passenger == self
        ratings << review.rating
      end
    end
    ratings.sum.to_f / ratings.length
  end

  def average_driver_rating
    ratings = []
    self.reviews_of.each do |review|
      if review.booking.driver == self
        ratings << review.rating
      end
    end
    ratings.sum.to_f / ratings.length
  end

end