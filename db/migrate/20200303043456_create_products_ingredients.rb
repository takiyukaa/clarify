class CreateProductsIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :products_ingredients do |t|
      t.references :product, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
