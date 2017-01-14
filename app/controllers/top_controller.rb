class TopController < ApplicationController
  def index
    render json: 'index'
  end

  def search(query, page=1, per=10)
    recipes = Recipe.tagged_with(query).page(page).per(per)
    render json: recipes
  end
end
