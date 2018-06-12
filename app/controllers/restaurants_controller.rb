class RestaurantsController < ApplicationController
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
    @restaurant = Restaurant.find(params[:id])
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
  end

  def update
  end

  def destroy
  end


    private

  def restaurant_params
    params.require(:restaurant).permit(:name, :user_id)
  end

end
