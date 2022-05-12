class DiscountAmountService
  attr_accessor :discount_class, :price, :quantity

  def initialize(discount_type, price, quantity)
    raise I18n.t('errors.wrong_discount_type') unless Product.discounts.keys.include?(discount_type)

    @discount_class = "Discounts::#{discount_type.classify}".constantize
    @price = price
    @quantity = quantity
  end

  def call
    discount_class.new(price, quantity).calculate
  end
end
