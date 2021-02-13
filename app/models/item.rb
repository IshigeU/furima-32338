class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivary_cost
  belongs_to_active_hash :delivary_day
  belongs_to_active_hash :items_category

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :condition_id
    validates :delivary_cost_id
    validates :prefecture_id
    validates :delivary_day_id
    validates :items_category_id
    validates :user
  end

  #ジャンルの選択が「--」の時は保存できないようにする(activehash)
  validates :prefecture_id, :condition_id, :delivary_cost_id, :delivary_day_id, :items_category_id, numericality: { other_than: 1 }

end