class Rating < ApplicationRecord
  MIN_RATING = 1.freeze
  MAX_RATING = 10.freeze

  belongs_to :user
  belongs_to :movie
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: MIN_RATING, less_than_or_equal_to: MAX_RATING}
  validates :movie_id, uniqueness: { scope: :user_id }

  after_create :update_movie_avg_rating

  private

  def update_movie_avg_rating
    avg_rating = Rating.where(movie_id: movie_id).average(:value)
    movie.update(average_rating: avg_rating)
  end
end
