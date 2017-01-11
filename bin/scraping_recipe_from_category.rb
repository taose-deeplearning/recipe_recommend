# https://github.com/rakuten-ws/rws-ruby-sdk
result = RakutenWebService::Recipe.ranking('10-277-520') # category_id; Top of the 4 meal in the genre display

result.each do |item|
  puts item['recipeTitle']
end
