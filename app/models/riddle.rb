class Riddle < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  geocoded_by :address, :latitude => :lat, :longitude => :lon
  after_validation :geocode
end
