class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user: current_user)
    @alltransactions = Transaction.all
    @my_sold_transactions = []
    @alltransactions.each do |alltransaction|
      if Product.find(alltransaction.product_id).user == current_user
        @my_sold_transactions << alltransaction
      end
    end

    # raise
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

    if @transaction.quantity <= Product.find(@transaction.product_id).stock && @transaction.save
      after_stock = Product.find(@transaction.product_id).stock - @transaction.quantity
      Product.find(@transaction.product_id).update(stock: after_stock)
      redirect_to transaction_path(@transaction), notice: 'Transaction created!'
    else
      render :new
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    unless @transaction.user == current_user
      redirect_to root_path, notice: 'Not allowed to Delete 😠'
    end
    product = Product.find(@transaction.product_id)
    before_stock = @transaction.quantity + product.stock
    product.update(stock: before_stock)
    @transaction.destroy
    redirect_to transactions_path, notice: 'Transaction destroyed!'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:quantity, :product_id)
  end
end
