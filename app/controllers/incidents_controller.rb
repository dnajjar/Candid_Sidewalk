class IncidentsController < ApplicationController
 

def create
    @incident = Incident.create(incident_params)
    if logged_in?
      @incident.user = current_user 
      @incident.user.incidents << @incident
    end
    redirect_to @incident
<<<<<<< HEAD
    @incident.get_city_data 
    IncidentMailer.welcome_email(@incident).deliver_now!
=======
    IncidentMailer.report_email(@incident).deliver_now!
>>>>>>> fce37f15d3ae0a89bcc455651da0953d33d89632
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
