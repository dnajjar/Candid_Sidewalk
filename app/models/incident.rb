class Incident < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
