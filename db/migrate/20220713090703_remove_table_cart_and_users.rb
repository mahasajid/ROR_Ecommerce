class RemoveTableCartAndUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :carts_users
  end
end
