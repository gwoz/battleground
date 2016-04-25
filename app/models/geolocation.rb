MINUTES_AGO = 50
NEARBY_DISTANCE_MAX = 50000000000000

class Geolocation < ActiveRecord::Base
  belongs_to :user

  def find_closest_challenger
    find_closest_challenger_geolocation.user
  end

  private

  def find_closest_challenger_geolocation
    get_recent_geolocations.find do |geolocation|
      p self.lonlat.distance(geolocation.lonlat)
      self.lonlat.distance(geolocation.lonlat) < NEARBY_DISTANCE_MAX
    end
  end

  def get_recent_geolocations
   Geolocation.includes(:user)
     .where("geolocations.created_at > ?", MINUTES_AGO.minutes.ago)
     .where(users: {in_battle: false})
  end
end

