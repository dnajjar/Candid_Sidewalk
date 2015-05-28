require 'open-uri'
class IncidentMailer < ApplicationMailer
  def welcome_email(incident)
    @image = incident.image
    @name = incident.name
    @description = incident.description
    # attachments.inline['image.jpg'] = open(@image).read
    attachments.inline['image.jpg'] = open("https://s3-us-west-2.amazonaws.com/candidsidewalk/#{@image.current_path}").read
    mail(to: "najjar.dana@gmail.com" , subject: 'For your consideration')
  end
end
