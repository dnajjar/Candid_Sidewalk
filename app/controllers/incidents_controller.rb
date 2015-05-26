class IncidentsController < ApplicationController
  
  # def index

  # end 

  def show
    
  end

  def create
    binding.pry
    @incident = Incident.create(incident_params)
    IncidentMailer.welcome_email.deliver!
    # redirect_to @photo
 end 
  
  def new
    @incident = Incident.new
  end 

  private
  def incident_params
    # params.require(:photo).permit(:filepicker_url)
  end 

end
