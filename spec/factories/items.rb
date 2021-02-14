FactoryBot.define do
  factory :item do
    name                  {'test'}
    price                 {500}
    description           {'テスト'}
    condition_id          {2}
    delivary_cost_id      {2}
    delivary_day_id       {2}
    prefecture_id         {2}
    items_category_id     {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
