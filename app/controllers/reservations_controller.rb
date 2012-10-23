class ReservationsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = current_user.reservations
    respond_with(@reservations)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = current_user.reservations.find(params[:id])
    respond_with(@reservation)
  end

  # GET /reservations/new
  def new
    @reservation = current_user.reservations.new
    @menu_items = MenuItem.of_the_next_seven_days.includes(:restaurant)
  end

  # GET /reservations/1/edit
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = current_user.reservations.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end
end
