class Discount
  attr_accessor :price, :quantity

  def initialize(price, quantity)
    @price = price
    @quantity = quantity
  end

  def calculate
    raise 'Should be implemented in inherited class'
  end
end
