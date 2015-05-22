class PhotoMailer < ApplicationMailer
  def welcome_email
    mail to: 'najjar.dana@gmail.com'  , subject: 'Welcome to My Awesome Site'
  end
end
