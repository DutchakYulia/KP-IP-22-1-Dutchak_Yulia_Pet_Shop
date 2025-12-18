module Admin
  class ReviewsController < BaseController
    def index
      @reviews = Review.includes(:user, :product).order(created_at: :desc)
    end

    def update
      review = Review.find(params[:id])
      if review.update(params.require(:review).permit(:approved))
        redirect_to admin_reviews_path, notice: "Оновлено"
      else
        redirect_to admin_reviews_path, alert: review.errors.full_messages.join(", ")
      end
    end

    def destroy
      Review.find(params[:id]).destroy
      redirect_to admin_reviews_path, notice: "Видалено"
    end
  end
end
