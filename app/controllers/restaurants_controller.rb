class RestaurantsController < ApplicationController

  before_action :find_rest, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def new
    @restaurant = Restaurant.new
    # calls for the same method within restaurant_policy
    authorize @restaurant
  end

  def index
    # policy_scope is a method that calls the scope resolve from REst_policy
     @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def show
    # calls for the same method within restaurant_policy
     authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    # calls for the same method within restaurant_policy
    authorize @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private

  def find_rest
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :price, :user_id, :photo)
  end

end
