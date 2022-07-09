class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.float :price, precision: 15, scale: 2
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
