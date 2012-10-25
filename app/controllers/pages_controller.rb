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
      format.html {
        redirect_to root_path, notice: "An email was sent to #{current_user.name}"
      }
      format.json {
        head :no_content
      }
    end
  end
end

