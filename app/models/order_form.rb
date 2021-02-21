class OrderForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city, :address ,:user_id

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  validates :item_id, presence: true

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    OrdererInfo.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end