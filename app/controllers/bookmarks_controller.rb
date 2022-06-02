class BookmarksController < ApplicationController
  def create
    @products = Product.all
    @product = Product.find(params[:product_id])
    @bookmark = Bookmark.new
    @bookmark.user_id = current_user.id
    @bookmark.product_id = @product.id
    @bookmark.save
    respond_to do |format|
      format.html { render partial: 'products/list_products', locals: { products: @products }, formats: [:html] }
    end
  end

  def destroy
    @products = Product.all
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.html { render partial: 'products/list_products', locals: { products: @products }, formats: [:html] }
    end
  end
end
