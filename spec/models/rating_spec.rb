require 'rails_helper'

RSpec.describe Rating, type: :model do
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
