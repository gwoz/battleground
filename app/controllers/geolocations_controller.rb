class GeolocationsController < ApplicationController
  def create
    @user = find_user_by_email
    @user_geolocation = Geolocation.create(user: @user, lonlat: make_wkt_point)
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
