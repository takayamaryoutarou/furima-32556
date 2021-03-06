class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create] 
  before_action :move_to_index, except: [:index, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :move_to_index_purchase, only: [:edit, :update, :destroy] 

  def index
    @items = Item.includes(:user).order(created_at: :desc)
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

  def show
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def move_to_index_purchase
    redirect_to root_path if  @item.purchase.present?
  end

end
