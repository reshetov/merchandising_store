module Discounts
  class MoreThree < Discount
    def calculate
      quantity < 3 ? 0 : price * quantity * 0.3
    end
  end
end
