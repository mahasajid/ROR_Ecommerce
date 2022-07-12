class AddOrderStatusToCart < ActiveRecord::Migration[7.0]
  def change

    add_column :carts, :order_status, :string , default: "pending"
  end
end
