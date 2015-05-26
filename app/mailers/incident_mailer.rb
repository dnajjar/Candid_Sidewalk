class IncidentMailer < ApplicationMailer
  def welcome_email(incident)
    @image = incident.image
    @name = incident.name
    @description = incident.description
    attachments.inline['image.jpg'] = File.read(@image.file.file)
    mail(to: "jtaub9503@gmail.com" , subject: 'Welcome to My Awesome Site')
  end
end
