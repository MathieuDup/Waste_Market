class ProductsController < ApplicationController

  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

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
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :sub_category, :characteristics, :quantity_left, :brand, :condition, :quantity_left, :buying_date, :expiration_date, :user_id)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :sub_category, :characteristics, :quantity_left, :brand, :condition, :quantity_left, :buying_date, :expiration_date, :photo)
  end
end
