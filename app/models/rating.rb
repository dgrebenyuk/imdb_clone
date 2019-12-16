class Rating < ApplicationRecord
  MIN_RATING = 1.freeze
  MAX_RATING = 10.freeze

  belongs_to :user
  belongs_to :movie
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: MIN_RATING, less_than_or_equal_to: MAX_RATING}
end
