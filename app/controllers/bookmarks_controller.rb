class BookmarksController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @bookmark = Bookmark.create(user: current_user, product: @product)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :bookmark_toggle }
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @product = @bookmark.product
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render :bookmark_toggle }
    end
  end
end
