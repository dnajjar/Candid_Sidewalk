class IncidentsController < ApplicationController
  
  # def index

  # end 

  def show
    
  end

  def create
    @incident = Incident.create(incident_params)
    binding.pry
    IncidentMailer.welcome_email.deliver!
    binding.pry
    # redirect_to @photo
 end 
  
  def new
    @incident = Incident.new
  end 

  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image)
  end 

end
