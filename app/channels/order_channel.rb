class OrderChannel < ApplicationCable::Channel
  def subscribed
    order = Order.find(params[:id])
    stream_for order
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
