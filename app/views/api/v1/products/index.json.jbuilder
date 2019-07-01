json.total_page @products.total_pages
json.products @products.each do |product|
    json.partial! 'product', locals: { product: product } 
end