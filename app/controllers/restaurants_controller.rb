class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    redirect_to restaurant_path(@restaurant)
    else
    render :new # which template to render, and new-view: because here we are able to do a "new input"
    end
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :review)
  end
end
