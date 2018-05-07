class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.driver_profile != nil
  end

  def show?
    user == record.passenger or user == record.driver
  end

end
