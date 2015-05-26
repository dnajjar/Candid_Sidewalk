class PhotoMailer < ApplicationMailer
  def welcome_email
    mail(to: "jtaub9503@gmail.com" , subject: 'Welcome to My Awesome Site')
  end
end
