# https://github.com/rakuten-ws/rws-ruby-sdk
items = RakutenWebService::Recipe.categories('small') #small, medium, large

items.each do |item|
  category_url = item['categoryUrl']
  category_path = category_url.match(/http:\/\/recipe\.rakuten\.co\.jp\/category\/(.+)\//)
  category = Category.new(
    rakuten_id: item['categoryId'],
    name: item['categoryName'],
    path: category_path[1]
  )

  if category.save
    puts "category ##{category.id}(#{category.rakuten_id}) Successfully created!"
  end
end

puts "Finished!"
