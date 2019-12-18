class Rating < ApplicationRecord
  MIN_VALUE = 1.freeze
  MAX_VALUE = 10.freeze

  belongs_to :user
  belongs_to :movie
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: MIN_VALUE, less_than_or_equal_to: MAX_VALUE}
  validates :movie_id, uniqueness: { scope: :user_id }

  after_create :update_movie_avg_rating
  after_destroy :update_movie_avg_rating

  private

  def update_movie_avg_rating
    avg_rating = Rating.where(movie_id: movie_id).average(:value) || 0
    movie.update(average_rating: avg_rating)
  end
end
