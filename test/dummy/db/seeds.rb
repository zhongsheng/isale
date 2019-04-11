30.times { Isale::Category.create!(name: Faker::Name.unique.name) }
30.times { Isale::Contry.create!(name: Faker::Nation.unique.nationality) }
30.times { Isale::Supplier.create!(company: Faker::Company.unique.name) }

100.times {
  category = Isale::Category.all.sample
  contry = Isale::Contry.all.sample
  supplier = Isale::Supplier.all.sample

  Isale::Product.create!(
    name: Faker::Name.unique.name,
    category: category,
    contry: contry,
    supplier: supplier,
    weight: Faker::Food.measurement,
    market_price: Faker::Number.decimal(2),
    wholesale_price: Faker::Number.decimal(2)
  )

}

Isale::User.create!({name: 'admin', role: 'admin', password: '123123'})
Isale::User.create!({name: 'guest', role: 'guest', password: '123123'})
