json.total_page @sales.total_pages
json.sales @sales.each do |sale|
    json.partial! 'sale', locals: { sale: sale } 
end