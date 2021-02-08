FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    encrypted_password    {password}
    sei                   {'tes'}
    mei                   {'tes'}
    kana_sei              {'tes'}
    kana_mei              {'tes'}
    birthday              {'2021/02/01'}
  end
end