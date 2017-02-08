class Band < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :locations, :genres

  validates :name, presence: true
end
