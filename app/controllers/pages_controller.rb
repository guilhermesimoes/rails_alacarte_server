class PagesController < ApplicationController

  def home
  end

  def sms_test
    # Having fun sending messages \o/
    # user = User.new({email: 'whatever@mail.com', telephone: 'cellphone_number', name: 'person_name'})
    # UserMailer.reservation_sms(user).deliver
    redirect_to root_path, notice: 'Reservation was successful.'
  end

  # POST /send_local_data.json?auth_token=secret
   def send_local_data
    # Convert params[:data] or whatever json object to a data variable
    data = 'asd'
    UserMailer.local_data(current_user, data).deliver
    render nothing: true
  end
end
