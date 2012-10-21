class PagesController < ApplicationController

  def home
  end

  def sms_test
    # Having fun sending messages \o/
    # user = User.new({email: 'whatever@mail.com', telephone: 'cellphone_number', name: 'person_name'})
    # UserMailer.reservation_sms(user).deliver
    redirect_to root_path, notice: 'Reservation was successful.'
  end
end
