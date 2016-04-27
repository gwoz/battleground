class User < ActiveRecord::Base
	has_and_belongs_to_many :battles

  validates :email, uniqueness: true, presence: true
  has_many :geolocations

  def total_points
  	get_win_points - get_loss_points
  end

  private

  WIN_VALUE = 15
  LOSS_VALUE = 5

  def get_win_points
  	self.battles.where(winner: self.id).count * WIN_VALUE
  end

  def get_loss_points
  	self.battles.where(loser: self.id).count * LOSS_VALUE
  end
  
end
