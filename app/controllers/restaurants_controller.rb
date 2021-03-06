class RestaurantsController < ApplicationController
  respond_to :html, :json, :xml

  # GET /restaurants
  # GET /restaurant.json
  def index
    @restaurants = Restaurant.order('name ASC')
    respond_with(@restaurants)
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    @menu_items = @restaurant.menu_items.of_the_next_seven_days
    respond_with(@restaurant)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  # GET /restaurants/:id/menu_items
  # GET /restaurants/:id/menu_items.json
  def menu_items
    @restaurant = Restaurant.find(params[:id])
    @menu_items = @restaurant.menu_items.of_the_next_seven_days
    @include_restaurants = false
    render "menu_items/index"
  end

  # GET /restaurants/:id/availability
  # GET /restaurants/:id/availability.json
  def availability
    restaurant = Restaurant.find(params[:id])
    @availability = restaurant.availability(params[:date])
  end
end
