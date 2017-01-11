# https://github.com/rakuten-ws/rws-ruby-sdk
items = RakutenWebService::Recipe.categories('small') #small, medium, large

count = 0
items.each do |item|
  count += 1
  puts item['categoryId']
  puts item['categoryName']
  category_url = item['categoryUrl']
  category_path = category_url.match(/http:\/\/recipe\.rakuten\.co\.jp\/category\/(.+)\//)
  puts category_path[1]
end
puts count
