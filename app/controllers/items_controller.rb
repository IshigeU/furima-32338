class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
    #@item = Item.find(params[:id])
    #unless current_user.id == @item.user.id
      #redirect_to action: :index
    #end
  #end

  #def update
    #@item = Item.find(params[:id])
    #f @item.update(item_params)
      #redirect_to item_path
    #else
      #render :edit
    #end
  #end
  
  #def destroy
    #@item = Item.find(prams[:id])
    #@item.destroy
    #redirect_to root_path
  #end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :condition_id, :delivary_cost_id, :prefecture_id, :delivary_day_id, :items_category_id).merge(user_id: current_user.id)
  end

end
