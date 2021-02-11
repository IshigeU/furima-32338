class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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
end