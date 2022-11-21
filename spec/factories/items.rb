FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce::price.floor }
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/fixtures/platanus.png'),
        'image/png'
      )
    end
  end
end
