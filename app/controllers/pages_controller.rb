class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  # require 'pry-byebug'
  # binding.pry
  def home
    products = Product.all.select do |product|
      product.stock.positive? && product.remove == false
    end
    if params[:query]
      products_array = products.sort_by { |event| [event.name] }
      activerecord = Product.where(id: products_array.map(&:id))
      @products = activerecord.search_by_name_and_address(params[:query])
      @markers = @products.geocoded.map do |product|
        {
          lat: product.latitude,
          lng: product.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
        }
      end
    else
      @products = products.sort_by { |event| [event.name] }
      activerecord = Product.where(id: @products.map(&:id))
      @markers = activerecord.geocoded.map do |product|
        {
          lat: product.latitude,
          lng: product.longitude,
          infoWindow: render_to_string(partial: "products/info_window", locals: { product: product })
        }
      end
    end
  end
end
