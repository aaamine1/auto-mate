desc "sample product creation"
task product_create: :environment do
  Product.create!(category: "snacks", name: "Lays chips 480gr")
end
