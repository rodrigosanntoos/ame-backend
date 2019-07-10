json.total_page @users.total_pages
json.users @users.each do |user|
    json.partial! 'user', locals: { user: user } 
end