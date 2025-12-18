module Admin
  class OrdersController < BaseController
    def index
      @orders = Order.includes(:user).order(created_at: :desc)
    end

    def show
      @order = Order.find(params[:id])
    end

    def update
      @order = Order.find(params[:id])
      if @order.update(params.require(:order).permit(:status))
        redirect_to admin_order_path(@order), notice: "Статус оновлено"
      else
        redirect_to admin_order_path(@order), alert: @order.errors.full_messages.join(", ")
      end
    end
  end
end
