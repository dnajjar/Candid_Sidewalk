require 'open-uri'
class IncidentMailer < ApplicationMailer
  def report_email(incident)
    @image = incident.image
    @name = incident.name
    @rep_name = incident.get_name
    @address = incident.location
    @description = incident.description
    # attachments.inline['image.jpg'] = open(@image).read
    attachments.inline['image.jpg'] = open("https://s3-us-west-2.amazonaws.com/candidsidewalk/#{@image.current_path}").read
    mail(to: "najjar.dana@gmail.com" , subject: 'For your consideration')
    # incident.get_email
  end
end
