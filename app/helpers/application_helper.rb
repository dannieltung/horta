module ApplicationHelper
  def product_image(product)
    if product.photo.present?
      product.photo.key
    else
      "no-image-icon"
    end
  end

  def user_image(current_user)
    if current_user.photo.present?
      current_user.photo.key
    else
      "avatar"
    end
  end
end
