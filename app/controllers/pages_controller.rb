class PagesController < ApplicationController

  def home
  end

  def sms_test
    # Having fun sending messages \o/
    # user = User.new({email: "whatever@mail.com", telephone: "cellphone_number", name: "person_name"})
    # UserMailer.reservation_sms(user).deliver
    redirect_to root_path, notice: "Reservation was successful."
  end

  # POST /send_local_data.json?auth_token=secret
  def send_local_data
    UserMailer.local_data(current_user, params[:data]).deliver
    respond_to do |format|
      format.json {
        head :no_content
      }
    end
  end

  # POST /send_local_reservation.json?auth_token=secret
  def send_local_reservation
    puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    puts params
    UserMailer.local_reservation(current_user, params[:reservation]).deliver
    respond_to do |format|
      format.json {
        head :no_content
      }
    end
  end
end
