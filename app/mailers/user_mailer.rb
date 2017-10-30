class UserMailer < ApplicationMailer
  default from: "raad34@gmail.com"
  def send_email(user)
    @user = user
    mail to: user.email, subject: "Thanks for signing up"
  end
end
