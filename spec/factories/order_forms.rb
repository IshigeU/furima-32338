FactoryBot.define do
  factory :order_form do
    city             {'Test'}
    address          {'Test1111-11'}
    token            {'tok_abcdefghijk00000000000000000'}
    post_code        {'123-1234'}
    prefecture_id    {2}
    phone_number     {'12312341234'}
    user_id          {1}
    item_id          {1}
  end
end