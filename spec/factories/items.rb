FactoryBot.define do
  factory :item do
    name                      {Faker::Name.initials(number: 2)}
    info                      {Faker::Lorem.sentence}
    category_id               {Faker::Number.between(from: 2, to: 10)}
    sales_status_id           {Faker::Number.between(from: 2, to: 7)}
    price                     {Faker::Number.between(from: 300, to: 9999999)}
    shipping_fee_status_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    scheduled_delivery_id     {Faker::Number.between(from: 2, to: 4)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end

end
