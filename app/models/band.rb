class Band < ApplicationRecord
  validates :name, presence: true

  acts_as_taggable_on :location_tags, :genres, :labels
  geocoded_by :location   # can also be an IP address
  after_validation :geocode     # auto-fetch coordinates

  belongs_to :user
  has_many :relationships, foreign_key: 'band_one_id'
  has_many :requested_relationships, class_name: Relationship, foreign_key: 'band_two_id'

  def all_relationships
    relationships.or(requested_relationships)
  end

  def sent_requests
    all_relationships.where(status: 0, action_band: self)
  end

  def pending_requests
    all_relationships.where(status:0, band_two: self)
  end
end
