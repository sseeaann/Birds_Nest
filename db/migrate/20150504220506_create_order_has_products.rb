class CreateOrderHasProducts < ActiveRecord::Migration
  def change
    create_table :order_has_products do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
