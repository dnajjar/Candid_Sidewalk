require 'google/api_client'
class Incident < ActiveRecord::Base
 
  # attr_accessor :address
  belongs_to :user
  mount_uploader :image, ImageUploader
  reverse_geocoded_by :latitude, :longitude


  def get_city_data
    client = CivicAide::Client.new(ENV['GOOGLE_KEY'])
    @results = client.representatives.at(location)
  end

  def get_council 
    get_city_data
    @council = @results["officials"].select do |key, value_hash|
      value_hash["urls"][0].match(/council\.nyc\.gov/) if value_hash["urls"]  
    end 
    @rep_name = @council[@council.keys.first]["name"]
    @number = @council[@council.keys.first]["phones"][0]
    @twitter = "@#{@council[@council.keys.first]["channels"][0]["id"]}"
    @photo_url = @council[@council.keys.first]["photo_url"]
    @email =  @council[@council.keys.first]["emails"][0]
  end

  def get_photo
    get_council
    @photo_url
  end 
  
   def get_name
    get_council
    @rep_name
  end 
  
  def get_email
    get_council
    @email
  end

  def get_number
    get_council
    @number
  end
  def get_twitter
    get_council
    @twitter = "@#{@council[@council.keys.first]["channels"][0]["id"]}"
  end

  def location
    @address = self.reverse_geocode
    # if @address = "5 Beaver Street, New York, NY 10004, USA"
    #   @location = "11 Broadway, New York, NY, 10004"
    # else 
    # @location = @address
    # end 
    # @location
  end 

  def zipcode
    @location.match(/(\d{5})/)[1]
  end 


end
