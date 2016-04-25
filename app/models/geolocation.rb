MINUTES_AGO = 50000
NEARBY_DISTANCE_MAX = 500000

class Geolocation < ActiveRecord::Base
  belongs_to :user

  def find_closest_challenger
    geolocation = find_closest_challenger_geolocation
    if geolocation
      geolocation.user
    end
  end

  private

  def find_closest_challenger_geolocation
    get_recent_geolocations.find do |geolocation|
      self.lonlat.distance(geolocation.lonlat) < NEARBY_DISTANCE_MAX
    end
  end

  def get_recent_geolocations
   Geolocation.includes(:user)
     .where(users: {in_battle: false})
     .where("geolocations.created_at > ?", MINUTES_AGO.minutes.ago)
  end
end

