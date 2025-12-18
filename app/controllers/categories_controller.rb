class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.where(active: true).order(created_at: :desc)
  end
end
