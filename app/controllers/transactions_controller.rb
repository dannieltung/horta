class TransactionsController < ApplicationController
  def index
    @products = Products.find(params[:product_id])
    @trans = Tran.all
  end

  def show
    @tran = Trans.show(params[:id])
  end

  def new
    @products = Product.find(params[:product_id])
    @tran = Trans.new
  end

  def create
    @products = Product.find(params[:product_id])
    @tran = Trans.new(product_params)
    # aqui ele vai instanciar um product com caracteristicas NEW
    @tran.products = @tran
    if @tran.save
      redirect_to product_path(@product), notice: 'Transaction completed!'
    else
      render :new
    end
  end

  private

  def transction_params
    params.require(:tran).permit(:quantity, :status)
  end
end
