class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    root_to_progress_done = "#{root_url}#{params[:controller]}/#{@order.id}/update_done"
    @qr_code = RQRCode::QRCode.new(root_to_progress_done)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: :mediumseagreen,
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

  def update_done
    @order = Order.find(params[:id])
    @order.update(progress: 'done')
    redirect_to root_path
  end
end
