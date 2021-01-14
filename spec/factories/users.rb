FactoryBot.define do
  factory :user do
    user_name { 'ogata' }
    email { Faker::Internet.free_email }
    password { 'aaa111' }
    password_confirmation { password }
    first_name { '和也' }
    last_name { '尾形' }
    first_katakana { 'カズヤ' }
    last_katakana { 'オガタ' }
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
