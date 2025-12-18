module Admin
  class DashboardController < BaseController
    def index
      @orders_count = Order.count
      @products_count = Product.count
      @messages_count = ContactMessage.count
      @pending_reviews = Review.where(approved: false).count
    end
  end
end
