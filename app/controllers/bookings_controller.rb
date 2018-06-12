class BookingsController < ApplicationController


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.restaurant = Restaurant.find(params[:restaurant_id])
     if @booking.save
    redirect_to booking_path(@booking.restaurant)
      else
    render :new
      end
  end



private


  def booking_params
    params.require(:booking).permit(:number_of_people, :restaurant_id, :user_id)
  end

end
