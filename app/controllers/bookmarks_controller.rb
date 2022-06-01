class BookmarksController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @bookmark = Bookmark.new
    @bookmark.user_id = current_user.id
    @bookmark.product_id = @product.id
    if @bookmark.save
      redirect_to products_path, notice: 'Bookmark added'
    else
      flash[:alert] = "ERROR: Bookmark not added"
      # redirect_to products_path, notice: 'ERROR: Bookmark not added'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to products_path, notice: 'Bookmark destroyed.'
  end
end
