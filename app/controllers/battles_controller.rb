class BattlesController < Application::API
  def show
    @battle = Battle.include
  end
end
