class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
