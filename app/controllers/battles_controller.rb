class BattlesController < ApplicationController
  def show
    @battle = Battle.includes(:users, :task).find(60)
  end
end
