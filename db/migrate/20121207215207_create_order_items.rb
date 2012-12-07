class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.reference :item_id
      t.reference :order_id
      t.integer :quantity
      t.decimal :price_paid_per_unit

      t.timestamps
    end
  end
end
