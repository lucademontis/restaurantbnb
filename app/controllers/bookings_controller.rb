class BookingsController < ApplicationController

  before_action :find_booking, only: [:edit, :update, :destroy]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking.restaurant = @restaurant
    authorize @booking
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    @booking.update(booking_params)
    authorize @booking
    if @booking.save
      redirect_to booking_requests_path
    else
      render :edit
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_path
  end



private

  def booking_params
    params.require(:booking).permit(:number_of_people, :start_date, :end_date, :restaurant_id, :user_id, :status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
