class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @user = current_user
    @product = Product.new(product_params)
    @product.user = @user
    if @product.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :sub_category, :characteristics, :quantity_left, :brand, :condition, :quantity_left, :buying_date, :expiration_date, :photo)
  end
end
