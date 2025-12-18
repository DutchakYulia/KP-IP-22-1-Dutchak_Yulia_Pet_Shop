class AddFilterFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :feed_type, :string
    add_column :products, :package, :string
    add_column :products, :grade, :string
    add_index :products, :feed_type
    add_index :products, :grade
  end
end
