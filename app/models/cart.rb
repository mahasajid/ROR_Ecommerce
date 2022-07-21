class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :user, optional: true
    accepts_nested_attributes_for :user
    before_update :update_order_status #:update_stock

    def add_product (product)
        current_item = line_items.find_by(product_id: product.id)

        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(product_id: product.id)
        
        end

        current_item

    end




  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end


  def update_order_status
    if self.order_status == "pending"
      self.order_status = "ordered"
      self.line_items.each {|item|
      item.product.stock = item.product.stock - item.quantity
      item.product.save}
    else
      self.order_status = "cancelled"
      self.line_items.each {|item|
      item.product.stock = item.product.stock + item.quantity
      item.product.save} 
    end
    
  end

end
