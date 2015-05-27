class IncidentMailer < ApplicationMailer
  def welcome_email(incident)
    @image = incident.image
    @name = incident.name
    @description = incident.description
    attachments.inline['image.jpg'] = File.read(@image.file.file)
    mail(to: "billydb@example.com" , subject: 'For your consideration')
  end
end
