module MoviesHelper
  def user_rating(movie)
    movie.ratings.where(user: current_user).pluck(:value).first
  end
end
