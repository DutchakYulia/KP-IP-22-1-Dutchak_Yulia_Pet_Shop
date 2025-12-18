class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :rating, null: false
      t.text :body, null: false
      t.boolean :approved, null: false, default: false

      t.timestamps
    end
  end
end
