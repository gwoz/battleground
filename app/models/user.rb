class User < ActiveRecord::Base
  has_many :battles, through: :users_battles
  has_many :user_locations
end
