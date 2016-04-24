MINUTES_AGO = 5
NEARBY_DISTANCE_MAX = 50

class Geolocation < ActiveRecord::Base
  belongs_to :user

  def find_closest_challenger
    find_closest_challenger_geolocation.user
  end

  private

  def find_closest_challenger_geolocation
    get_recent_geolocations.find {|geolocation| lonlat.distance(geolocation.lonlat) < NEARBY_DISTANCE_MAX}
  end

  def get_recent_geolocations
    Geolocation.where("created_at > ?", MINUTES_AGO.minutes.ago)
  end
end
