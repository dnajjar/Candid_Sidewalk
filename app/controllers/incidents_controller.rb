class IncidentsController < ApplicationController

def about
end   
def index
  @incidents = Incident.all
end 
def new
  @incident = Incident.new
end

def create
  
    @incident = Incident.create(incident_params)
    
    if logged_in?
      @incident.user = current_user 
      @incident.user.incidents << @incident
    end
    @incident.get_city_data 
    IncidentMailer.report_email(@incident).deliver_now!
    redirect_to @incident
 end 
 
  
  def show
    @incident = Incident.find(params[:id])
  end

   

  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image, :location, :latitude, :longitude)
  end 


end
