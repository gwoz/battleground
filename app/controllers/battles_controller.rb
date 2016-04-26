class BattlesController < ApplicationController

  def decline
    battle_json = JSON.parse(request.body.string)
    @user = User.find_by(email: battle_json['battle']['users'][0]['email'])
    @challenger = User.find_by(email: battle_json['battle']['users'][1]['email'])
    @battle = Battle.find_by(id: battle_json['battle']['id'])

    @user.update(in_battle: false)
    @challenger.update(in_battle: false)
    @battle.update(winner: @challenger.id)
    @battle.update(loser: @user.id)


    render json: @battle
  end

  def accept
    battle_json = JSON.parse(request.body.string)
    @user = User.find_by(email: battle_json['battle']['users'][0]['email'])
    @challenger = User.find_by(email: battle_json['battle']['users'][1]['email'])
    @battle = Battle.find_by(id: battle_json['battle']['id'])

    render json: @battle
  end

end
