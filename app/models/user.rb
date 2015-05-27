class User < ActiveRecord::Base
  has_many :incidents
  has_secure_password
  validates :email, presence: true, uniqueness: true 
end
