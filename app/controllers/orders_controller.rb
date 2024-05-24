class OrdersController < ApplicationController
  before_action :set_cart, only: [:create]

  def index
    @orders = Order.includes(:products).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new
    @cart.items.each do |product_id|
      @order.order_items.build(product_id: product_id)
    end
    Rails.logger.info "Order items before saving: #{@order.order_items.map(&:product_id)}"
    if @order.save
      Rails.logger.info "Order saved successfully with total: #{@order.total}"
      clear_cart
      render json: { id: @order.id, message: 'Order was successfully created.' }, status: :created
    else
      Rails.logger.error "Order save failed with errors: #{@order.errors.full_messages}"
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: 'Order was successfully destroyed.'
  end

  private

  def clear_cart
    @cart.clear
    save_cart
  end

  def set_cart
    cart_data = cookies[:cart_data] ? JSON.parse(cookies[:cart_data]) : []
    @cart = Cart.new(cart_data)
  end

  def save_cart
    cookies[:cart_data] = { value: JSON.generate(@cart.items), expires: 1.week.from_now }
  end
end
