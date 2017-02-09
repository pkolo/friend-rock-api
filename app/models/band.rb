class Band < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :location_tags, :genres, :labels
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :name, presence: true
end
