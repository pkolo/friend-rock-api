class Relationship < ApplicationRecord
  belongs_to :band_one, class_name: Band
  belongs_to :band_two, class_name: Band
  belongs_to :action_band, class_name: Band

  validate :unique_pair, on: :create
  validate :not_self_relation, on: :create

  def not_self_relation
    if band_one == band_two
      errors.add(:band_one, "You cannot friend yourself")
    end
  end

  def unique_pair
    if any_pair? || any_reverse_pair?
      errors.add(:band_one, "Duplicate relationship exists")
    end
  end

  def any_pair?
    Relationship.where(band_one: band_one, band_two: band_two).any?
  end

  def any_reverse_pair?
    Relationship.where(band_one: band_two, band_two: band_one).any?
  end
end
