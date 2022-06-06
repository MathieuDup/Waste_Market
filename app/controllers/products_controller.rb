class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.all
    if params[:category]
      @products = Product.where(category_id: params[:category])
      redirect_to products_path(anchor: "product-anchor")
    elsif params[:search]
      @products = Product.global_search(params[:search][:query])
    else
      @products = Product.all
    end
  end

  def show
    @markers = [{
      lat: @product.user.latitude,
      lng: @product.user.longitude,
      info_window: render_to_string(partial: "info_window", locals: { product: @product }),
      image_url: helpers.asset_url(@product.user.photo.attached? ? cl_image_path(@product.user.photo.key) : "/assets/images/emy.jpg")
    }]
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
    params.require(:product).permit(:name, :description, :price, :category_id, :sub_category_id, :characteristics, :quantity_left, :brand, :condition, :quantity_left, :buying_date, :expiration_date, :photo)
  end
end
