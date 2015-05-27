class IncidentsController < ApplicationController
  
  # def index

  # end 

  def show
    @incident = Incident.find(params[:id])
    # binding.pry
  end

  def create
    @incident = Incident.create(incident_params)
    # @incident.latitude = @incident.location.split(",")[0]
    # @incident.longitude = @incident.location.split(",")[1]
    IncidentMailer.welcome_email(@incident).deliver_now!
    redirect_to @incident
 end 
  
  def new
    @incident = Incident.new
  end 

  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image, :location, :latitude, :longitude)
  end 

end
