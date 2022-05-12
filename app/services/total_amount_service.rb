class TotalAmountService
  attr_accessor :items, :discount

  def initialize(params: {})
    @discount = params[:discount].present?
    @items = params[:items].to_h
  end

  def call
    return 0 unless @items

    @items.reduce(0) { |acc, elem| acc + product_amount(elem[0].to_i, elem[1].to_i) }
  end

  private

  def product_amount(product_id, quantity)
    product = product_data[product_id]
    return 0 unless product

    amount = product.price * quantity
    amount -= DiscountAmountService.new(product.discount, product.price, quantity).call if discount
    amount
  end

  def product_data
    @product_data ||=
      Product.pluck(:id, :price, :discount)
             .to_h { |data| [data[0], OpenStruct.new(price: data[1], discount: data[2])] }
  end
end
