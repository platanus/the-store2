FactoryBot.define do
  factory :review do
    user
    item
    body { "MyString" }
    rating { 1 }
  end
end
