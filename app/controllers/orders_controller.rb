class OrdersController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    # @items = Item.includes(:user).order(created_at: :desc)
    @item = Item.find(params[:item_id])
    @purchase_procedure = PurchaseProcedure.new   

  end



  def create
    
    @item = Item.find(params[:item_id])
    @purchase_procedure = PurchaseProcedure.new(purchase_procedure_params)
   
    if @purchase_procedure.valid?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_procedure_params[:token],    
        currency: 'jpy'                
      )
      @purchase_procedure.save
      redirect_to root_path
    else
      render  'index'
    end
   
    
  end

  private

  def purchase_procedure_params
    params.require(:purchase_procedure).permit(:postal_code, :city, :block, :building_name,:prefecture_id,:phone_number).merge(token: params[:token],item_id: params[:item_id], user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

 
end
