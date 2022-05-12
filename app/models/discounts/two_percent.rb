module Discounts
  class TwoPercent < Discount
    def calculate
      (price * quantity * discount_multiplier).round(2)
    end

    private

    def discount_multiplier
      return 0.3 if quantity >= 150

      quantity / 10 * 0.02
    end
  end
end
