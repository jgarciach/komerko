class AddBusinessIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :business_id, :integer
  end
end
