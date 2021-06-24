FactoryBot.define do
  factory :item do
    name                      {Faker::Name.initials(number: 2)}
    info                      {Faker::Text}
    category_id               {Faker::NumberBetween($min = 1,$max = 11 )}
    sales_status_id           {Faker::NumberBetween($min = 2,$max = 7 )}
    price                     {Faker::NumberBetween($min = 300,$max = 9999999 )}
    shipping_fee_status_id    {Faker::NumberBetween($min = 2,$max = 3 )}
    prefecture_id             {Faker::NumberBetween($min = 2,$max = 48 )}
    scheduled_delivery_id     {Faker::NumberBetween($min = 2,$max = 4 )}
    association :user
  end
end
