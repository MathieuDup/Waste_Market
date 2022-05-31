class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @buyer_orders = @user.orders.order(created_at: :desc)
    @products = @user.products.order(created_at: :desc)
    @seller_orders = @user.products.orders.order(created_at: :desc)
    @reviews = @user.reviews.order(created_at: :desc)
    @bookmarks = @user.bookmarks.order(created_at: :desc)
    raise
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :address, :password, :password_confirmation)
  end
end
