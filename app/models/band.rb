class Band < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :locations, :genres
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :name, presence: true
end
