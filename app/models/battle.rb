class Battle < ActiveRecord::Base
  has_many :users, through: :users_battles
  has_many :user_locations
end
