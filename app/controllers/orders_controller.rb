class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @review = Review.new
    root_to_progress_done = "#{root_url}#{params[:controller]}/#{@order.id}/update_done"
    @qr_code = RQRCode::QRCode.new(root_to_progress_done)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: :black,
      fill: :white,
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 6
    )
    @messages = Message.all
    @message = Message.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    if current_user.can_order?(@product)
      @order.user_id = current_user.id
      @order.product_id = @product.id
      @order.progress = "pending"
      @order.save
      redirect_to order_path(@order)
    else
      flash[:alert] = "You cannot order this product."
      render 'products/show'
    end
  end

  def edit
  end

  def update
    @order = Order.find(params[:id])
    @order.update(progress: params[:progress])
    redirect_to user_path(current_user), notice: params[:notice]
  end

  def update_done
    @order = Order.find(params[:id])
    @order.update(progress: 'done')
    QrcodeChannel.broadcast_to(@order, render_to_string(partial: "order_validation", locals: { order: @order }))
    redirect_to root_path
  end
end
