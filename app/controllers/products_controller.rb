class ProductsController < ApplicationController

  def index
    products = Product.where(user: current_user)
    # @products = policy_scope(Product).order(name: :asc)
    @products = products.sort_by { |event| [event.name] }
  end

  def show
    @review = Review.new
    @product = Product.find(params[:id])
    @markers = [{
                  lat: @product.latitude,
                  lng: @product.longitude
    }]
    # foreach itera sobre uma array não importa que seja uma array de apenas um objeto.
    # require 'pry-byebug'
    # binding.pry
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: 'Product created!'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path, notice: 'Not allowed to Edit 😥'
    end
  end

  def update
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path, notice: 'Not allowed to Update 😥'
    end
    # authorize @product
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated!'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path, notice: 'Not allowed to Delete 😠'
    end
    # authorize @product
    @product.update(remove: true)
    redirect_to root_path, notice: 'Product destroyed!'
  end

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :address, :photo)
  end
end
