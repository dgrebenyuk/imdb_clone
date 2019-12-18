class MoviesController < ApplicationController
  before_action :set_movie, only: :show

  def index
    @movies = current_user ? Movie.includes(:ratings).page(params[:page])  : Movie.all.page(params[:page])
  end

  def show; end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
