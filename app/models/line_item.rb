class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart


  def total_price
    self.quantity * self.product.price
  end
end
