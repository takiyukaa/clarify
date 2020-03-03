class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :brand
      t.text :description
      t.integer :barcode

      t.timestamps
    end
  end
end
