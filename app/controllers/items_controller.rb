class ItemsController < ApplicationController
  def index
  end

  def new
    @display = Display.new
  end


end
