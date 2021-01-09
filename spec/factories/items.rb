FactoryBot.define do
  factory :item do
    title                      { '商品名' }
    category_id                { 1 }
    state_id                   { 1 }
    prefecture_id              { 1 }
    delivery_date_id           { 1 }
    delivery_charge_id         { 1 }
    price                      { 1000 }
    product_description        { '商品説明' }
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    association :user
  end
end
