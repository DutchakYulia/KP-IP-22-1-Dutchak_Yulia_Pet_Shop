class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total, precision: 10, scale: 2, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :delivery_method, null: false, default: 0
      t.integer :payment_method, null: false, default: 0
      t.string :name, null: false
      t.string :phone, null: false
      t.text :address, null: false
      t.text :comment

      t.timestamps
    end
  end
end
