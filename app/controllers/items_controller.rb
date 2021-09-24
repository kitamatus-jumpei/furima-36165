class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    # @item = item.find(params[:user_id])
    # @item.save
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
