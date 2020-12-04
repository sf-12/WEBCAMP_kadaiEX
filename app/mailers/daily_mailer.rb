# frozen_string_literal: true

class DailyMailer < ApplicationMailer
  default from: ENV['GOOGLE_MAIL_ADDRESS']

  def daily_email(user)
    @user = user
    mail(to: @user.email, subject: 'デイリーメールです。')
  end
end
