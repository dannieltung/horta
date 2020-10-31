class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    products = Product.all.select do |product|
      product.stock.positive? && product.remove == false
    end
    @products = products.sort_by { |event| [event.name] }
    activerecord = Product.where(id: @products.map(&:id))
    @markers = activerecord.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude
      }
    end
    # require 'pry-byebug'
    # binding.pry
  end
end
