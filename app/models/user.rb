class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :car
  has_one :driver_profile

  has_many :passenger_bookings, class_name: 'Booking', foreign_key: 'passenger_id'
  has_many :driver_bookings,    class_name: 'Booking', foreign_key: 'driver_id'

  has_many :reviews_of_user,    class_name: 'Review', foreign_key: 'reviewee_id'
  has_many :reviews_by_user,    class_name: 'Review', foreign_key: 'reviewer_id'
end