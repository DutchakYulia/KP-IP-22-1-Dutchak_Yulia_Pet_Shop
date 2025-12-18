class ProductsController < ApplicationController
  def index
    @animal = params[:animal].presence
    @categories_all = Category.order(:name)
    @categories = @categories_all
    @categories = @categories.where(animal: @animal) if @animal
    @categories_by_animal = @categories_all.group_by(&:animal)
    @q = params[:q].to_s.strip
    @category_id = params[:category_id].presence
    min_price = params[:min_price].presence
    max_price = params[:max_price].presence
    feed_type = params[:feed_type].presence
    package = params[:package].presence
    grade = params[:grade].presence
    scope = Product.includes(:category).where(active: true)
    scope = scope.joins(:category).where(categories: { animal: @animal }) if @animal
    scope = scope.where(category_id: @category_id) if @category_id
    scope = scope.where("title LIKE ?", "%#{@q}%") if @q.present?
    scope = scope.where("price >= ?", min_price) if min_price
    scope = scope.where("price <= ?", max_price) if max_price
    scope = scope.where(feed_type: feed_type) if feed_type
    scope = scope.where(package: package) if package
    scope = scope.where(grade: grade) if grade
    @products = scope.order(created_at: :desc)

    %w[cats dogs].each_with_object({}) do |key, h|
      h[key] = Product.includes(:category).joins(:category).where(active: true, categories: { animal: key }).order(created_at: :desc).limit(6)
      instance_variable_set("@popular_#{key}", h[key])
    end
  end

  def show
    @product = Product.includes(:category).find(params[:id])
    @reviews = @product.reviews.includes(:user).where(approved: true).order(created_at: :desc)
    @review = Review.new
    @similar_products = Product.where(category_id: @product.category_id, active: true).where.not(id: @product.id).limit(6)
    @popular_products = Product.where(active: true).order(created_at: :desc).limit(8)
  end
end
