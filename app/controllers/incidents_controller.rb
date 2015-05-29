class IncidentsController < ApplicationController
 

def create
    @incident = Incident.create(incident_params)
    @incident.get_city_data
    redirect_to @incident
    IncidentMailer.welcome_email(@incident).deliver_now!
    # redirect_to incident_path
    
    # redirect_to action: :show
 end 
  
  def show
    # binding.pry
    @incident = Incident.find(params[:id])
  end

  def new
    @incident = Incident.new
  end 

  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image, :location, :latitude, :longitude)
  end 

end
