class Battle < ActiveRecord::Base
	has_and_belongs_to_many :users

  has_many :user_locations
  belongs_to :task
end



