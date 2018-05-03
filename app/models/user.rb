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
end
