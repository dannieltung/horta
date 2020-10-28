class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transactions = Transaction.show(params[:id])
  end

  # ficou desnecessario ter esse metodo
  # def new
  #   @user = User.find(params[:user_id])
  #   @products = Product.find(params[:product_id])
  #   @transactions = Transaction.new
  # end

  def create
    @product = Product.find(params[:product_id])
    @transaction = Transaction.new(product_params)
    # aqui ele vai instanciar um product com caracteristicas NEW
    @transaction.product = @product
    @transaction.user = current_user

    raise
    # @transaction.valid?
    # @transaction.errors.messages

    if @transaction.save
      redirect_to product_path(@product), notice: 'Transaction completed!'
    else
      render :new
    end
  end

  private

  def transction_params
    params.require(:transactions).permit(:quantity, :status)
  end
end
