require 'open-uri'
class IncidentMailer < ApplicationMailer
  def welcome_email(incident)
    @image = incident.image
    @name = incident.name
    @description = incident.description
    @rep_name = incident.get_name
    @location = incident.location
    # attachments.inline['image.jpg'] = open(@image).read
    attachments.inline['image.jpg'] = open("https://s3-us-west-2.amazonaws.com/candidsidewalk/#{@image.current_path}").read
    mail(to: "najjar.dana@example.com" , subject: 'For your consideration')
    # incident.get_email
  end
end
