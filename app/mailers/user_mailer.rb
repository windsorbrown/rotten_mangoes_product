class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def delete_email_sender(user)
   @user = user
   mail(to: @user.email, subject: 'You are now deleted')
  end
end
