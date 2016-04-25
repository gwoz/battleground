class User < ActiveRecord::Base
  has_many :battles, through: :users_battles

  validates :email, uniqueness: true, presence: true
  has_many :geolocations
end
