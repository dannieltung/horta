module ApplicationHelper
  def product_image(product)
    if product.photo.present?
      product.photo.key
    else
      "sample"
    end
  end

  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] += " " + options[:class]
    end
      doc.to_html.html_safe
  end

  def user_image(current_user)
    if current_user.photo.present?
      current_user.photo.key
    else
      "avatar"
    end
  end

end

