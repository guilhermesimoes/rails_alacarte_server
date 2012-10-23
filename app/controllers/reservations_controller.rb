class ReservationsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  # GET /reservations
  # GET /reservations.json
  def index
    respond_to do |format|
      format.html {
        @user = current_user
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])
      }
    end
    @reservations = @user.reservations
    respond_with(@reservations)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    respond_to do |format|
      format.html {
        @user = current_user
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])
      }
    end
    @reservation = @user.reservations.find(params[:id])
    respond_with(@reservation)
  end

  # GET /reservations/new
  def new
    @reservation = current_user.reservations.new
    @menu_items = MenuItem.of_the_week
  end

  # GET /reservations/1/edit
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    respond_to do |format|
      format.html {
        @user = current_user

        @reservation = @user.reservations.new(params[:reservation])

        if @reservation.save
          redirect_to @reservation, notice: 'Reservation was successfully created.'
        else
          render action: "new"
        end
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])

        @reservation = @user.reservations.new(params[:reservation])

        if @reservation.save

          # Send an SMS informing the user his reservation was successful
          # UserMailer.reservation_sms(@user).deliver if @user.telephone?

          render json: @reservation, status: :created, location: @reservation
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      }
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    respond_to do |format|
      format.html {
        @user = current_user

        @reservation = @user.reservations.find(params[:id])

        if @reservation.update_attributes(params[:reservation])
          redirect_to @reservation, notice: 'Reservation was successfully updated.'
        else
          render action: "edit"
        end
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])

        @reservation = @user.reservations.find(params[:id])

        if @reservation.update_attributes(params[:reservation])
          head :no_content
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      }
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    respond_to do |format|
      format.html {
        @user = current_user

        @reservation = @user.reservations.find(params[:id])

        @reservation.destroy
        redirect_to reservations_url
      }
      format.json {
        @user = User.find_by_authentication_token(params[:auth_token])

        @reservation = @user.reservations.find(params[:id])

        @reservation.destroy
        head :no_content
      }
    end
  end
end
