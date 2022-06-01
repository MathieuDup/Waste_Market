class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    # @buyer_orders = current_user.orders.where.not(progress: "Cancelled").order(created_at: :desc)
    @buyer_orders = current_user.orders.order(created_at: :desc)
    @products = current_user.products.order(created_at: :desc)
    # @seller_orders = current_user.orders_as_owner.where.not(progress: "Cancelled").order(created_at: :desc)
    @seller_orders = current_user.orders_as_owner.order(created_at: :desc)
    @reviews = current_user.my_reviews
    @bookmarks = current_user.bookmarks.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :address, :password, :password_confirmation, :photo)
  end
end
