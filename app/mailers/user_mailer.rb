class UserMailer < ActionMailer::Base
  default from: "AlaCarte <noreply.alacarte@gmail.com>"

  def reservation_sms(user,reservation)
    @user = user
    @reservation = reservation
    mail(to: ENV['DEI_EMAIL'], subject: user.telephone)
  end

  def local_data(user, data)
    @user = user
    @data = data
    mail(to: user.email, subject: "#{user.name}, Your SASUC Reservations!")
  end

  def local_reservation(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: user.email, subject: "#{user.name}, a tua reserva SASUC")
  end
end
