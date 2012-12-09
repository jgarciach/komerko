class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :phone
      t.string :city
      t.string :state
      t.string :nickname
      t.string :name

      t.timestamps
    end
  end
end
