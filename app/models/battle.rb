ACCEPT_BATTLE_POINTS = 5
DECLINE_BATTLE_POINTS = -5
WIN_BATTLE_POINTS = 25

class Battle < ActiveRecord::Base
	has_and_belongs_to_many :users

  has_many :user_locations
  belongs_to :task

  def accept_decline_points(response)
    case response
    when 'accept'
      ACCEPT_BATTLE_POINTS
    when 'decline'
      DECLINE_BATTLE_POINTS
    end
  end

  def change_battle_score(user,points)
  end

end



