FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.free_email }
    password              {'000aaa'}
    encrypted_password    {'000aaa'}
    sei                   {'テストてすと試験'}
    mei                   {'テストてすと試験'}
    kana_sei              {'テスト'}
    kana_mei              {'テスト'}
    birthday              {'2021/02/01'}
  end
end