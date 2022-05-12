class ProductsController < ApplicationController
  before_action :find_product, only: :update

  def index
    render json: filtered_products
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def total
    @total = TotalAmountService.new(params: total_params).call
    render json: { total: @total }
  end

  private

  def filtered_products
    @products = Product.all
    @products = @products.filtered_by(params[:q]) if params[:q].present?
    @products
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:code, :name, :price)
  end

  def total_params
    params.permit(:discount, items: {})
  end
end
