class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.integer :total, null: false
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
