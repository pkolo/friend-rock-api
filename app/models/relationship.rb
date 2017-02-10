class Relationship < ApplicationRecord
  belongs_to :band_one, class_name: Band
  belongs_to :band_two, class_name: Band
  belongs_to :action_band, class_name: Band

  validate :unique_pair

  def unique_pair
    if any_pair? || any_reverse_pair?
      errors.add(:band_one, "duplicate relationship exists")
    end
  end

  def any_pair?
    Relationship.where(band_one: band_one, band_two: band_two).any?
  end

  def any_reverse_pair?
    Relationship.where(band_one: band_two, band_two: band_one).any?
  end
end
