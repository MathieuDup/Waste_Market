class ReviewsController < ApplicationController
  # def new
  #   # @review = Review.new
  #   # @order = Order.find(params[:order_id])
  # end

  def create
    @order = Order.find(params[:order_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.order = @order
    if @review.save
      redirect_to order_path(@order)
      flash[:alert] = "Review successfully created."
    else
      flash[:alert] = "Something went wrong."
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
