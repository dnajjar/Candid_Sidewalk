class IncidentsController < ApplicationController
 
def index
  @incidents = Incident.all
end 

def create
    @incident = Incident.create(incident_params)
    
    if logged_in?
      @incident.user = current_user 
      @incident.user.incidents << @incident
    end
    redirect_to @incident
    @incident.get_city_data 
    IncidentMailer.report_email(@incident).deliver_now!
 end 
  
  def show
    @incident = Incident.find(params[:id])
    # show.js.erb
  end

  def new
    @incident = Incident.new
  end 

  def marker
    # marker is an array of lat/long defined in model
    # make json call  
    respond_to do |format|
      format.json {render :markers}
    end 
    latitude = @incident.latitude
    longitude = @incident.longitude
  end 
  def about
    
  end
  private
  def incident_params
    params.require(:incident).permit(:name, :description, :image, :location, :latitude, :longitude)
  end 

end
