class BattlesController < ApplicationController

  def accept_deny
    @user = find_user_by_email
    @challegner = find_challenger_by_email
    @battle = find_battle_by_id
    user_response = find_user_response

    if user_response == 'decline'
      # TODO add score
      @user.update(in_battle: false)
      @challenger.update(in_battle: false)
      @battle.update(winner: @challenger)
    elsif user_response == 'accept'
      # TODO add score
      @user.update(in_battle: false)
      render :accept_deny_response
    end
    render nothing: true
  end

  private

  def find_user_by_email
  end

  def find_challenger_by_email
  end

  def find_battle_by_id
  end

  def find_user_response
  end

end
