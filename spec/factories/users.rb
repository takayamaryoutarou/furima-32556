FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    name                      { Faker::Name.initials(number: 2) }
    email                     { Faker::Internet.free_email }
    password                  { '00t0aa' }
    password_confirmation     { password }
    birthday                  { Faker::Date.backward }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
  end
end
