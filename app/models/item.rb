class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :purchase_history

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivary_cost
  belongs_to_active_hash :delivary_day
  belongs_to_active_hash :items_category

  with_options presence: true do
    validates :name
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :price, format:{ with: /\A[0-9]+\z/ } 
    validates :description
    validates :image
  end

  #ジャンルの選択が「--」の時は保存できないようにする(activehash)
  validates :prefecture_id, :condition_id, :delivary_cost_id, :delivary_day_id, :items_category_id, numericality: { other_than: 1 }

end