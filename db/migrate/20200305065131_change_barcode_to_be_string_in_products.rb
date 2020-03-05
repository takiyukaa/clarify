class ChangeBarcodeToBeStringInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :barcode, :string
  end
end
