class UserMailer < ActionMailer::Base
  default from: "AlaCarte <noreply.alacarte@gmail.com>"

  def reservation_sms(user)
    @user = user
    mail(to: ENV['DEI_EMAIL'], subject: user.telephone)
  end

  def local_data(user, data)
    @data = data
    mail(to: user.email, subject: "#{user.name}, here is your data!")
  end
end
