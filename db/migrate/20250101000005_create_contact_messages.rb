class CreateContactMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :body, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
