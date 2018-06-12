class BookingsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    restaurant = Restaurant.find(params[:restaurant_id])
    @booking.restaurant = restaurant
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to restaurant_path(restaurant)
    else
      render :new
    end
  end

private

  def booking_params
    params.require(:booking).permit(:number_of_people, :start_date, :end_date, :restaurant_id, :user_id)
  end

end
