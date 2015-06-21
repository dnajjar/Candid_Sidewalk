require 'open-uri'
class IncidentMailer < ApplicationMailer
  def report_email(incident)
    @image = incident.image
    @name = incident.name
    @rep_name = incident.get_name
    @address = incident.location
    @description = incident.description
    @rep_name = incident.get_name
    @location = incident.location
    # attachments.inline['image.jpg'] = open(@image).read
    attachments.inline['image.jpg'] = open("#{@image.url}").read
    mail(to: "jtaub9503@gmail.com" , subject: 'For your consideration')
    # incident.get_email
  end
end
