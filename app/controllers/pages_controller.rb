class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all.select do |product|
      product.stock > 0
    end
  end
end
