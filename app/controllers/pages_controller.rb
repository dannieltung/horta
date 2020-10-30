class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    products = Product.all.select do |product|
      product.stock.positive? && product.remove == false
    end
    @products = products.sort_by { |event| [event.name] }
  end
end
