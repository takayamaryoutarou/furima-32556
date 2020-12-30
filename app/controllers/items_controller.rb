class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def new
    @item = Item.new
  end
end
