class Movie < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :ratings

  def categories_list
    categories.pluck(:name).join('/')
  end
end
