class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
    @user = @transaction.user
    @product = @transaction.product
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    # o devise já não faz entender que o user é o current_user?
    # @product = Product.find(params[:product_id])
    # @transaction.product = @product

    # raise
    # fazer as seguintes checagens:
    # @transaction.valid?
    # @transaction.errors.messages
    if @transaction.save
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
