class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description_id, :condition_id, :delivary_cost_id, :prefecture_id, :delivary_day_id, :items_category_id, :user)
  end
end
