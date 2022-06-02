if @bookmark.persisted?
  json.form json.partial!("products/card_product.html.erb", product: @product, bookmark: Bookmark.new)
  json.inserted_item json.partial!("products/card_product.html.erb", bookmark: @bookmark)
else
  json.form json.partial!("prodcuts/card_product.html.erb", product: @product, bookmark: @bookmark)
end
