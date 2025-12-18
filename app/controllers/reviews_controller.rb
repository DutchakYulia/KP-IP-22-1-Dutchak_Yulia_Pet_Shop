class ReviewsController < ApplicationController
  before_action :require_login

  def create
    product = Product.find(params[:product_id])
    review = product.reviews.new(review_params.merge(user: current_user, approved: false))
    if review.save
      redirect_to product_path(product), notice: "Відгук надіслано на модерацію"
    else
      redirect_to product_path(product), alert: review.errors.full_messages.join(", ")
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
