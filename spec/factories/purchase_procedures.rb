FactoryBot.define do
  factory :purchase_procedure do

    postal_code               { '123-4567' }
    city                      { '千葉市' }
    block                     { '4' }
    phone_number              { '09043514667' }
    item_id                   { 2 }
    user_id                   { 2 }
    token                     { "tok_abcdefghijk00000000000000000" }
    prefecture_id             { 1 }

  
  end
 
 
end
