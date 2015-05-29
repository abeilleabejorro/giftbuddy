class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(current_user)
    @user = current_user
    @url  = 'http://example.com/login'
    mail(to: 'cruble4@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
