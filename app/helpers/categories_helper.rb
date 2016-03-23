module CategoriesHelper
  def total_products(category)
    @products = Product.where(category_id: category.id)
    @products.count
  end
end
