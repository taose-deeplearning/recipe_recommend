class TopController < ApplicationController
  def index
    render json: 'index'
  end

  def search(query)
    recipes = Recipe.tagged_with(query)
    render json: recipes
  end
end
