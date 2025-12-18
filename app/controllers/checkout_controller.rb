class CheckoutController < ApplicationController
  before_action :require_login

  def new
    redirect_to cart_path, alert: "Кошик порожній" if current_cart.empty?
    @order = Order.new
    ids = current_cart.keys.map(&:to_i)
    @products = Product.where(id: ids).index_by(&:id)
  end

  def create
    cart = current_cart
    redirect_to cart_path, alert: "Кошик порожній" and return if cart.empty?

    order = current_user.orders.new(order_params)

    items = Product.where(id: cart.keys.map(&:to_i))
    total = items.sum do |p|
      qty = cart[p.id.to_s].to_i
      p.price.to_d * qty
    end
    order.total = total
    order.status = (order.payment_method == "card_mock") ? "paid" : "new_order"

    Order.transaction do
      order.save!
      items.each do |p|
        qty = cart[p.id.to_s].to_i
        order.order_items.create!(product: p, quantity: qty, price_snapshot: p.price)
        if p.stock
          new_stock = [p.stock.to_i - qty, 0].max
          p.update!(stock: new_stock)
        end
      end
    end

    session[:cart] = {}
    redirect_to order_path(order), notice: "Замовлення створено!"
  rescue => e
    redirect_to checkout_path, alert: "Помилка оформлення: #{e.message}"
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :address, :comment, :delivery_method, :payment_method)
  end
end
