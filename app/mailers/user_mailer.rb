class UserMailer < ApplicationMailer
  default from: "protsan.valeriya@gmail.com"
  def welcome_email(email_address)
    @signup_date = Time.zone.now
    mail(to: email_address, subject: "Welcome to Rails")
  end
end
