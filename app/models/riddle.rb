class Riddle < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  geocoded_by :latitude, :longitude
  after_validation :geocode
end
