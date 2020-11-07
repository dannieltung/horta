class ReviewsController < ApplicationController

  # def new
  #   @product = Product.find(params[:product_id])
  #   @review = Review.new
  # end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    if Transaction.where(user: current_user, product_id: @review.product_id).empty?
      redirect_to root_path, notice: 'Not allowed to review this product.'
    end

    if @review.save
      redirect_to product_path(@product), notice: 'Thanks for Reviewing'
    else
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to root_path, notice: 'Not allowed to Delete 😩'
    end
    @review.destroy
    redirect_to product_path(@review.product_id), notice: 'Review Destroyed!'
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
