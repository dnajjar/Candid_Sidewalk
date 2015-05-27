require 'google/api_client'
class Incident < ActiveRecord::Base
  attr_accessor :address
  belongs_to :user

   mount_uploader :image, ImageUploader
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  

end
