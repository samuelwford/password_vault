class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token
    mail to: user.email, subject: "Password Reset"
  end
end
