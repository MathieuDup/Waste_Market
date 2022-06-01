class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    if current_user.can_order?(@product.id)
      @order.user_id = current_user.id
      @order.product_id = @product.id
      @order.progress = "Pending"
      @order.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = "You cannot order this product."
      redirect_to product_path(@product)
    end
  end

  def edit
  end

  def update
    @order = Order.find(params[:id])
    @order.update(progress: params[:progress])
    redirect_to user_path(current_user), notice: params[:notice]
  end
end
