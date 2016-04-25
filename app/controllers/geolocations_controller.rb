class GeolocationsController < ApplicationController
  def create
    @user = find_user_by_email
    @user_geolocation = Geolocation.create(user: @user, lonlat: make_wkt_point)

    @challenger = @user_geolocation.find_closest_challenger
    if @challenger
      @challenger_geolocation = @challenger.geolocations.last

      # @user.in_battle = true
      # @user.save
      # @challenger.in_battle = true
      # @challenger.save

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
    User.find_by(email: params[:email])
  end

  def make_wkt_point
    longitude = params[:geolocation][:coords][:longitude]
    latitude = params[:geolocation][:coords][:latitude]
    "POINT (#{longitude} #{latitude})"
  end
end
