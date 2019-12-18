class MoviesController < ApplicationController
  def index
    @movies = current_user ? Movie.includes(:ratings).page(params[:page])  : Movie.all.page(params[:page])
    @categories = Category.order(:name)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
