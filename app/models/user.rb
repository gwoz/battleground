class User < ActiveRecord::Base
	has_and_belongs_to_many :battles

  validates :email, uniqueness: true, presence: true
  has_many :geolocations
end
