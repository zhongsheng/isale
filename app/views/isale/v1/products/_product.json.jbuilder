json.extract! product, :id, :photo, :name, :market_price
json.url v1_product_url(product, format: :json)
