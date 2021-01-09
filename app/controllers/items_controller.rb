class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :category_id, :genre_id, :product_description, :delivery_date_id,
                                 :delivery_charge_id, :prefecture_id, :state_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session unless user_signed_in?
  end
end
