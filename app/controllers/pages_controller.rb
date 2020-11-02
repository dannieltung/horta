class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  # require 'pry-byebug'
  # binding.pry
  def home
    if params[:query]
      products = Product.all.select do |product|
        product.name == params[:query] && product.stock.positive? && product.remove == false
      end
    else
      products = Product.all.select do |product|
        product.stock.positive? && product.remove == false
      end
    end
    @products = products.sort_by { |event| [event.name] }
    activerecord = Product.where(id: @products.map(&:id))
    @markers = activerecord.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude
      }
    end
  end
end
