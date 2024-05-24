class CartController < ApplicationController
  before_action :set_cart


  def add_to_cart
    if @cart.add_product(params[:product_id])
      save_cart
      render json: { count: @cart.total_items, added: true }
    else
      render json: { count: @cart.total_items, added: false }
    end
  end

  def show
    @cart_items = Product.find(@cart.items)
    render json: @cart_items
  end

  def clear_cart
    @cart.clear
    save_cart
    render json: { message: "El carrito se ha limpiado correctamente" }
  end

  def cart_count
    render json: { count: @cart.total_items }
  end

  private

  def set_cart
    cart_data = cookies[:cart_data] ? JSON.parse(cookies[:cart_data]) : []
    @cart = Cart.new(cart_data)
  end

  def save_cart
    cookies[:cart_data] = { value: JSON.generate(@cart.items), expires: 1.week.from_now }
  end

  def cart_cache_key
    "cart_#{session.id}"
  end
end
