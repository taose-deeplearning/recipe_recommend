categories = Category.all


categories.each do |category|
  # https://github.com/rakuten-ws/rws-ruby-sdk
  items = RakutenWebService::Recipe.ranking(category.path)
  items.each do |item|
    recipe = Recipe.new(
      rakuten_id: item['recipeId'],
      title: item['recipeTitle'],
      url: item['recipeUrl'],
      food_image_url: item['foodImageUrl'],
      medium_image_url: item['mediumImageUrl'],
      small_image_url: item['smallImageUrl'],
      pickup: item['pickup'],
      shop: item['shop'],
      description: item['recipeDescription'],
      indication: item['recipeIndication'],
      cost: item['recipeCost'],
      publishday: item['recipePublishday'],
      rank: item['rank'].to_i,
      category_id: category.id
    )

    materials = item['recipeMaterial']

    materials.each do |material|
      recipe.material_list.add(material)
    end

    if recipe.save
      puts "recipe ##{recipe.id}(#{recipe.rakuten_id}) Successfully created!"
    else
      puts "Already created or error."
    end

    sleep(1)
  end
end

puts "Finished!"
