class MenuItemsController < ApplicationController
  respond_to :html, :json


  # GET /menu_items/:id/menus_by_restaurants     :id -> restaurant_id
  # GET /menu_items/:id/menus_by_restaurants.json
  def menus_by_restaurants
    @menu_items = MenuItem.where(:restaurant_id => params[:id])
    @menu_items = @menu_items.where('date >= ?',Time.now)

    respond_with(@menu_items)
  end

  # GET /menu_items
  # GET /menu_items.json
  def index
    @menu_items = MenuItem.all
    respond_with(@menu_items)
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show
    @menu_item = MenuItem.find(params[:id])
    respond_with(@menu_item)
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
    @restaurants = Restaurant.all
    @meals = Meal.all
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
    @restaurants = Restaurant.all
    @meals = Meal.all
  end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully created.' }
        format.json { render json: @menu_item, status: :created, location: @menu_item }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.json
  def update
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to menu_items_url }
      format.json { head :no_content }
    end
  end
end
