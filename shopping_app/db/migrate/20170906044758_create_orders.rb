class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.references :customer, foreign_key: true
      t.references :delivery_address, foreign_key: true

      t.timestamps
    end
  end
end
