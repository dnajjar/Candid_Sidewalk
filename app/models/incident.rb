require 'google/api_client'
class Incident < ActiveRecord::Base
 
  attr_accessor :address
  belongs_to :user
  mount_uploader :image, ImageUploader
  reverse_geocoded_by :latitude, :longitude

  def get_city_data
    client = CivicAide::Client.new(ENV['GOOGLE_KEY'])
    results = client.representatives.at(location)

    @district = results['offices']['oa']['name']
    @official_hash = results["officials"]["pb"]
    @name = @official_hash["name"]
    # @email = @official_hash["emails"][0]
    @number = @official_hash["phones"][0]
    @twitter = "@#{@official_hash["channels"][0]["id"]}"
    @photo_url = @official_hash["photo_url"]
  end

  def get_name
    client = CivicAide::Client.new(ENV['GOOGLE_KEY'])
    results = client.representatives.at(location)
    @district = results['offices']['oa']['name']
    @official_hash = results["officials"]["pb"]
    @name = @official_hash["name"]
  end 
  
  def location
    @location = self.reverse_geocode
  end 

  def zipcode
    @location.match(/(\d{5})/)[1]
  end 


end
