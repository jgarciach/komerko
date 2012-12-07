class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item
      t.references :order
      t.integer :quantity
      t.decimal :price_paid_per_unit

      t.timestamps
    end
  end
end
