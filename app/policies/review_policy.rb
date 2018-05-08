class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    booking = record.booking
    
    # check if already have a review
    hasnt_reviewed = true
    booking.reviews.each do |review|
      if user == review.reviewer
        hasnt_reviewed = false
      end
    end

    (user == booking.passenger or user == booking.driver) && (hasnt_reviewed)
  end

  def create?
    # currently doesnt work!
    # new?
  end

  def show?
    user == record.reviewee
  end
end
