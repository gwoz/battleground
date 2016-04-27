class User < ActiveRecord::Base
	has_and_belongs_to_many :battles
  validates :email, uniqueness: true, presence: true
  has_many :geolocations

  WIN_VALUE = 15
  LOSS_VALUE = 5

  def update_total_points
  	self.points = get_win_count * WIN_VALUE - get_loss_count * LOSS_VALUE
  	self.save
  end

  def get_win_count
  	self.battles.where(winner: self.id).count
  end

  def get_loss_count
  	self.battles.where(loser: self.id).count
  end

end
