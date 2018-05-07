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


  def reviews_as_driver
    @_driver_reviews ||= self.reviews_of.select do |review|
      review.booking.driver == self
    end
  end

  def reviews_as_passenger
    @_passenger_reviews ||= self.reviews_of.select do |review|
      review.booking.passenger == self
    end
  end

  def average_passenger_rating
    ratings = reviews_as_passenger.pluck(:rating)
    @_average_passenger_rating ||= average_rating(ratings)
  end

  def average_driver_rating
    ratings = reviews_as_driver.pluck(:rating)
    @_average_driver_rating ||= average_rating(ratings)
  end

  private

  def average_rating(ratings)
    return 0 if ratings.empty?
    ratings.sum.to_f / ratings.length
  end

end