module ApplicationHelper
  def product_image(product)
    if product.photo.present?
      product.photo.key
    else
      "sample"
    end
  end
end
