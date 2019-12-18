class CategoriesController < ApplicationController
  def show
    @category = Category.where('name ILIKE ?', params[:id]).first
    if @category
      @movies = Movie.joins(:categories).where(categories: { id: @category.id }).references(:categories).includes(:ratings).page(params[:page])
    else
      redirect_to root_path
    end
  end
end
