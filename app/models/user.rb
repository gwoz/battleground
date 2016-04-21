class User < ActiveRecord::Base
  has_and_belongs_to_many :battles
  has_many :user_locations
end
