class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    root_to_progress_done = "http://localhost:3000/#{params[:controller]}/#{@order.id}?progress=done"
    @qr_code = RQRCode::QRCode.new(root_to_progress_done)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    if current_user.can_order?(@product)
      @order.user_id = current_user.id
      @order.product_id = @product.id
      @order.progress = "pending"
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
