class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
   Item.create(item_params)
  #  @item = item.find(params[:user_id])
   @item.save
  end

  private
  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :charge_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end



end
