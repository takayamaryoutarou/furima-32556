class OrdersController < ApplicationController

  def index
    # @items = Item.includes(:user).order(created_at: :desc)
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    #@item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :delivery_charge_id).merge(user_id: current_user.id)
  end

end
