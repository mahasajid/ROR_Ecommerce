class RemoveShippingAddressFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :shipping_address, :string
  end
end
