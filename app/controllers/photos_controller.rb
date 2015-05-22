class PhotosController < ApplicationController
  
  
  def create
    binding.pry
    @photo = Photo.create(photo_params)
  end 
  
  def new
    @photo = Photo.new
  end 
  
  private
  def photo_params
    params.require(:photo).permit(:filepicker_url)
  end 

end
