# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def delete_email_sender_preview
    ApplicationMailer.delete_email_sender(User.first)
  end
end
