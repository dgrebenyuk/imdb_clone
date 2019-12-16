require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe '#validations' do
    it 'validates value' do
      rating = Rating.new()

      rating.value = 'awesome'
      rating.valid?
      expect(rating.errors.keys).to include(:value)

      rating.value = 0
      rating.valid?
      expect(rating.errors.keys).to include(:value)

      rating.value = 11
      rating.valid?
      expect(rating.errors.keys).to include(:value)

      rating.value = 5
      rating.valid?
      expect(rating.errors.keys).not_to include(:value)
    end
  end

  describe '#update_movie_avg_rating' do
    let(:movie) { create(:movie) }

    it 'should update movie average rating value after create' do
      create(:rating, movie: movie, value: 5)
      create(:rating, movie: movie, value: 6)
      expect(movie.reload.average_rating).to eq(5.5)
    end
  end
end
