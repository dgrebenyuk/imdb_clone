class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.save
    respond_to do |format|
      format.js
    end
  end

  private

  def rating_params
    params.permit(:movie_id, :value)
  end
end
