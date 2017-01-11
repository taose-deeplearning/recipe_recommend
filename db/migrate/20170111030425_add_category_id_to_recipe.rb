class AddCategoryIdToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :category, index: true
  end
end
