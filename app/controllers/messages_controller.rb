class MessagesController < ApplicationController
  def index
  end

  def create
    @order = Order.find(params[:order_id])
    @message = Message.new(message_params)
    @message.order = @order
    @message.user = current_user
    if @message.save
      OrderChannel.broadcast_to(
        @order,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "orders/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
