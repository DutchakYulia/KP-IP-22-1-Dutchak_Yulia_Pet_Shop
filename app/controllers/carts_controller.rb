class CartsController < ApplicationController
  def show
    ids = current_cart.keys.map(&:to_i)
    @products = Product.where(id: ids).index_by(&:id)
  end

  def add
    pid = params[:product_id].to_s
    current_cart[pid] = current_cart.fetch(pid, 0).to_i + 1
    redirect_back fallback_location: root_path, notice: "Додано в кошик"
  end

  def update
    pid = params[:product_id].to_s
    qty = params[:quantity].to_i
    if qty <= 0
      current_cart.delete(pid)
    else
      current_cart[pid] = qty
    end
    redirect_to cart_path, notice: "Кошик оновлено"
  end

  def remove
    current_cart.delete(params[:product_id].to_s)
    redirect_to cart_path, notice: "Прибрано з кошика"
  end

  def clear
    session[:cart] = {}
    redirect_to cart_path, notice: "Кошик очищено"
  end
end
