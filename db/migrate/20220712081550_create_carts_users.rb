class CreateCartsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :carts_users do |t|
        t.belongs_to :user
        t.belongs_to :cart
      t.timestamps
    end
  end
end
