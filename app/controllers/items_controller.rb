class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  

  def index
  end

  def new
    #@item = Item.new
  end
end
