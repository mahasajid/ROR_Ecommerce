class AddShippingAddressToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :shipping_address, :string
  end
end
