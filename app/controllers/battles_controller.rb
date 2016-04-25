class BattlesController < ApplicationController
  def show
    @battle = Battle.includes(:users, :task).find(1)
  end
end
