class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notics: "Restaurant was siccessfully created."
    else
      render :new
    end
  end
end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :category, :phone_number)
end
