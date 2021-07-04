FactoryBot.define do
  factory :order_pay_form do
    token { 'tok_abcdefgh00000000000000000000' }
    postal_code { '123-4567' }
    prefecture { 8 }
    city { '福島市' }
    addresses { '福島1-1' }
    building { 'フクシマビル1F' }
    phone_number { '09012345678' }
  end
end
