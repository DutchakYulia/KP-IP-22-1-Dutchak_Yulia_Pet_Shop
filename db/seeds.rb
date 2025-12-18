# Admin user
admin = User.find_or_initialize_by(email: "admin@petshop.local")
admin.password = "admin1234"
admin.password_confirmation = "admin1234"
admin.role = :admin
admin.save!

animals = [
  {
    key: "dogs",
    label: "Собаки",
    categories: [
      { name: "Сухий корм для собак", slug: "dog-dry-food" },
      { name: "Консерви для собак", slug: "dog-wet-food" },
      { name: "Іграшки для собак", slug: "dog-toys" },
      { name: "Гігієна для собак", slug: "dog-hygiene" }
    ],
    products: [
      { title: "Сухий корм для собак 2 кг", slug: "dog-dry-food", price: 499.0, stock: 30, image: "https://images.unsplash.com/photo-1629752187687-3d3c7ea3c92c?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "2kg_bag", grade: "premium" },
      { title: "Консерва яловичина для собак", slug: "dog-wet-food", price: 165.0, stock: 40, image: "https://images.unsplash.com/photo-1605478266873-9fef08ba1ca5?auto=format&fit=crop&w=900&q=80", feed_type: "wet", package: "can", grade: "standard" },
      { title: "Іграшка м’яч для собак", slug: "dog-toys", price: 199.0, stock: 50, image: "https://images.unsplash.com/photo-1605902711622-cfb43c44367f?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: nil, grade: nil },
      { title: "Шампунь для собак 250 мл", slug: "dog-hygiene", price: 189.0, stock: 25, image: "https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: "bottle", grade: "premium" }
    ]
  },
  {
    key: "cats",
    label: "Коти",
    categories: [
      { name: "Сухий корм для котів", slug: "cat-dry-food" },
      { name: "Консерви для котів", slug: "cat-wet-food" },
      { name: "Наповнювач для туалету", slug: "cat-litter" },
      { name: "Іграшки для котів", slug: "cat-toys" }
    ],
    products: [
      { title: "Сухий корм для котів 2 кг", slug: "cat-dry-food", price: 389.0, stock: 35, image: "https://images.unsplash.com/photo-1574158622682-e40e69881006?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "2kg_bag", grade: "premium" },
      { title: "Консерва індичка для котів", slug: "cat-wet-food", price: 82.0, stock: 60, image: "https://images.unsplash.com/photo-1450778869180-41d0601e046e?auto=format&fit=crop&w=900&q=80", feed_type: "wet", package: "can", grade: "standard" },
      { title: "Наповнювач для котячого туалету 5 л", slug: "cat-litter", price: 219.0, stock: 45, image: "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: "bag", grade: "standard" },
      { title: "Іграшкова вудка з пір’ям", slug: "cat-toys", price: 139.0, stock: 70, image: "https://images.unsplash.com/photo-1573865526739-10659fec78a5?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: nil, grade: nil }
    ]
  },
  {
    key: "birds",
    label: "Птахи",
    categories: [
      { name: "Корм для птахів", slug: "bird-food" },
      { name: "Ласощі для птахів", slug: "bird-treats" },
      { name: "Годівниці та поїлки", slug: "bird-accessories" }
    ],
    products: [
      { title: "Зернова суміш для папуг 1 кг", slug: "bird-food", price: 155.0, stock: 30, image: "https://images.unsplash.com/photo-1508184904665-1c0c4e8096be?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "1kg_bag", grade: "standard" },
      { title: "Ласощі медові палички для хвилястих", slug: "bird-treats", price: 88.0, stock: 40, image: "https://images.unsplash.com/photo-1501139083538-0139583c060f?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "pouch", grade: "standard" },
      { title: "Комплект годівниця + поїлка", slug: "bird-accessories", price: 129.0, stock: 25, image: "https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: nil, grade: nil }
    ]
  },
  {
    key: "rodents",
    label: "Гризуни",
    categories: [
      { name: "Корм для гризунів", slug: "rodent-food" },
      { name: "Сіно та підстилка", slug: "rodent-hay" },
      { name: "Іграшки та тунелі", slug: "rodent-toys" }
    ],
    products: [
      { title: "Корм для хом’яків 700 г", slug: "rodent-food", price: 96.0, stock: 35, image: "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "pouch", grade: "standard" },
      { title: "Сіно лугове 1 кг", slug: "rodent-hay", price: 115.0, stock: 50, image: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "1kg_bag", grade: "standard" },
      { title: "Дерев’яний тунель для гризунів", slug: "rodent-toys", price: 145.0, stock: 20, image: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: nil, grade: nil }
    ]
  },
  {
    key: "fish",
    label: "Рибки",
    categories: [
      { name: "Корм для акваріумних риб", slug: "fish-food" },
      { name: "Догляд за акваріумом", slug: "fish-care" },
      { name: "Декор для акваріума", slug: "fish-decor" }
    ],
    products: [
      { title: "Комбікорм для тропічних риб 200 г", slug: "fish-food", price: 89.0, stock: 60, image: "https://images.unsplash.com/photo-1524704796725-9fc3044a58c8?auto=format&fit=crop&w=900&q=80", feed_type: "dry", package: "pouch", grade: "standard" },
      { title: "Кондиціонер для води 250 мл", slug: "fish-care", price: 175.0, stock: 25, image: "https://images.unsplash.com/photo-1465406325903-25cfc1622da8?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: "bottle", grade: "premium" },
      { title: "Набір декоративних рослин", slug: "fish-decor", price: 210.0, stock: 30, image: "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=900&q=80", feed_type: nil, package: nil, grade: nil }
    ]
  }
]

category_map = {}

animals.each do |animal|
  animal[:categories].each do |cat|
    category = Category.find_or_initialize_by(slug: cat[:slug])
    category.name = cat[:name]
    category.animal = animal[:key]
    category.save!
    category_map[cat[:slug]] = category
  end
end

animals.each do |animal|
  animal[:products].each do |prod|
    category = category_map[prod[:slug]]
    next unless category

    product = Product.find_or_initialize_by(title: prod[:title])
    product.category = category
    product.price = prod[:price]
    product.stock = prod[:stock]
    product.image_url = prod[:image]
    product.feed_type = prod[:feed_type]
    product.package = prod[:package]
    product.grade = prod[:grade]
    product.description = "Якісний товар для #{animal[:label].downcase}. В наявності на складі."
    product.active = true
    product.save!
  end
end

puts "Seed done. Admin: admin@petshop.local / admin1234"
