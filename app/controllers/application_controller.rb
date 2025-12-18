class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_cart, :cart_count

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: "Увійди в акаунт" unless logged_in?
  end

  def require_admin
    redirect_to root_path, alert: "Доступ заборонено" unless logged_in? && current_user.admin?
  end

  # session cart: { "product_id" => quantity }
  def current_cart
    session[:cart] ||= {}
  end

  def cart_count
    current_cart.values.map(&:to_i).sum
  end
end
