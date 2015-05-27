require 'open-uri'
class IncidentMailer < ApplicationMailer
  def welcome_email(incident)
    # url = "https://console.aws.amazon.com/s3/home?region=us-west-2#&bucket=candidsidewalk&prefix=uploads/incident/image/"
    @image = incident.image
    @name = incident.name
    @description = incident.description
    # attachments.inline["filename"] = open(@image.url).read
    attachments.inline['image.jpg'] = open("https://s3-us-west-2.amazonaws.com/candidsidewalk/uploads/incident/image/117/Dana_-_Final_B_W.jpg").read
    mail(to: "najjar.dana@gmail.com" , subject: 'For your consideration')
  end
end
