class Booking < ApplicationRecord
  belongs_to :passenger,    class_name: 'User'
  belongs_to :driver,       class_name: 'User', optional: true

  belongs_to :origin,       class_name: 'Location'
  belongs_to :destination,  class_name: 'Location'

  has_many :reviews

  validates :origin_address,      presence: true
  validates :destination_address, presence: true
  
  def cost_in_cents
    cost*100
  end
end
