class IncidentsController < ApplicationController
 

def create
    @incident = Incident.create(incident_params)
    if logged_in?
      @incident.user = current_user 
      @incident.user.incidents << @incident
    end
    @incident.get_city_data 
    redirect_to @incident
    IncidentMailer.report_email(@incident).deliver_now!
 end 
  
  def show
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
