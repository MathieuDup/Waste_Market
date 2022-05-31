class OrdersController < ApplicationController

  def index
  end

  def show
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    @order.user_id = current_user.id
    @order.product_id = @product.id
    @order.progress = "Draft"
    @order.save
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end
end
