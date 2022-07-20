class AddBillingAddressToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :billing_address, :string
  end
end
