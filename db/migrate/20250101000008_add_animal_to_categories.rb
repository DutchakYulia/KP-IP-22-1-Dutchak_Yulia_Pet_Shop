class AddAnimalToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :animal, :string
    add_index :categories, :animal
  end
end
