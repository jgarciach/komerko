class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_type

      t.timestamps
    end
  end
end
