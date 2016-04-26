class GeolocationsController < ApplicationController
  def create
    @data = JSON.parse(request.body.string)
    @user = find_user_by_email
    @user_geolocation = Geolocation.create(user: @user, lonlat: make_wkt_point)

    @challenger = @user_geolocation.find_closest_challenger
    if @challenger
      @challenger_geolocation = @challenger.geolocations.last

      # @user.update(in_battle: true)
      # @challenger.update(in_battle: true)

      @battle = Battle.create(task_id: 1)
      @battle.users << @user
      @battle.users << @challenger
      render :show
    else
      render nothing: true
    end
  end

  private

  def find_user_by_email
    User.find_by(email: @data['user'])
  end

  def make_wkt_point
    longitude = @data['location']['coords']['longitude']
    latitude = @data['location']['coords']['latitude']
    "POINT (#{longitude} #{latitude})"
  end
end
