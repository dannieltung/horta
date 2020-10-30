class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
    @user = @transaction.user
    @product = @transaction.product
  end

  # def new
  #   @transaction = Transaction.new
  # end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    # raise
    # fazer as seguintes checagens:
    # @transaction.valid?
    # @transaction.errors.messages

    if @transaction.save
      after_stock = Product.find(@transaction.product_id).stock - @transaction.quantity
      Product.find(@transaction.product_id).update(stock: after_stock)
      redirect_to transaction_path(@transaction), notice: 'Transaction created!'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:quantity, :product_id)
  end
end
