class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :rakuten_id, unique: true
      t.string :title
      t.string :url
      t.string :food_image_url
      t.string :medium_image_url
      t.string :small_image_url
      t.integer :pickup
      t.integer :shop
      t.text :description
      t.string :indication
      t.string :cost
      t.string :publishday
      t.integer :rank

      t.timestamps
    end
  end
end
