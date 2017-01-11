class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :rakuten_id, unique: true
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
