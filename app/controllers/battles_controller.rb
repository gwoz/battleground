class BattlesController < ApplicationController
  def show
    @battle = Battle.find(1)
  end
end
