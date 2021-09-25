class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
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
    #  ↑出品するボタンを押したときに、どこに遷移するかを記述する。
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :charge_id, :area_id, :days_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
