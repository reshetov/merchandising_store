FactoryBot.define do
  factory :product, aliases: [:mug] do
    code { 'MUG' }
    name { 'Reedsy Mug' }
    price { 6.00 }
    discount { 'two_percent' }

    trait :tshirt do
      code { 'TSHIRT' }
      name { 'Reedsy T-shirt' }
      price { 15.00 }
      discount { 'more_three' }
    end

    trait :hoodie do
      code { 'HOODIE' }
      name { 'Reedsy Hoodie' }
      price { 20.00 }
      discount { 'default' }
    end
  end
end
