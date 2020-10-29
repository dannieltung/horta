class ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # aqui ele vai instanciar um product com caracteristicas NEW
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product), notice: 'Product created!'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    # aqui ele vai instanciar com as características do product achado
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Product updated!'
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :user_id)
  end
  # é certo eu liberar o user_id em caso de update? user pode dizer que pertence a outro user.

end
