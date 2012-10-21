class PagesController < ApplicationController

  def home
  end

  def sms_test
    # Having fun sending messages \o/
    # guilherme   = User.new({email: 'whatever1@mail.com', telephone: '914355942', name: 'Guilherme'})
    # penetra     = User.new({email: 'whatever2@mail.com', telephone: '914423862', name: 'Penetra'})
    # bernardino  = User.new({email: 'whatever3@mail.com', telephone: '916208182', name: 'Bernardino'})
    # francisco   = User.new({email: 'whatever4@mail.com', telephone: '910772788', name: 'Francisco'})
    # gaia        = User.new({email: 'whatever5@mail.com', telephone: '916390012', name: 'Gaia'})
    # UserMailer.reservation_sms(guilherme).deliver
    # UserMailer.reservation_sms(penetra).deliver
    # UserMailer.reservation_sms(bernardino).deliver
    # UserMailer.reservation_sms(francisco).deliver
    # UserMailer.reservation_sms(gaia).deliver
    redirect_to root_path, notice: 'Reservation was successful.'
  end
end
