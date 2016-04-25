class GeolocationsController < ApplicationController
  def create
    @user = find_user_by_email
    @user_geolocation = Geolocation.create(user: @user, lonlat: make_wkt_point)

    @challenger = @user_geolocation.find_closest_challenger
    if @challenger
      @challenger_geolocation = @challenger.geolocations.last

      @user.in_battle = true
      @challenger.in_battle = true

      @battle = Battle.create(task_id: 1)
      @battle.users << @user
      @battle.users << @challenger

      # render 'battles/show', @battle
      binding.pry
    end
  end

  private

  def find_user_by_email
    User.find_by(email: params[:email])
  end

  def make_wkt_point
    longitude = params[:geolocation][:coords][:longitude]
    latitude = params[:geolocation][:coords][:latitude]
    "POINT (#{longitude} #{latitude})"
  end
end
