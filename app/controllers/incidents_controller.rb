class IncidentsController < ApplicationController
  
  # def index

  # end 

  def show
    render nothing: :true
  end

  def create
    @incident = Incident.create(incident_params)
    # @incident.latitude = @incident.location.split(",")[0]
    # @incident.longitude = @incident.location.split(",")[1]
       binding.pry
    IncidentMailer.welcome_email(@incident).deliver_now!
    redirect_to @incident
 end 
  
  def new
    @incident = Incident.new
  end 

  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image, :location)
  end 

end
