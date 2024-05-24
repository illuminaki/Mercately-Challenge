6.times do |i|
    Product.create(
        name: "Product #{i + 1}",
        price: rand(5.0..100.0).round(2)
    )
end