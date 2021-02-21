class PurchaseHistoriesController < ApplicationController

  def index
    @orderform = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @orderform = OrderForm.new(purchase_history_params)
    if @orderform.valid?
      @orderform.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def purchase_history_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
