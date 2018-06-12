class DashboardController < ApplicationController
skip_after_action :verify_authorized


  def my_bookings
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def my_restaurants
    # policy_scope calls solve method that retrieves all restaurants
    @restaurants = policy_scope(Restaurant).where(user: current_user)
  end

end
