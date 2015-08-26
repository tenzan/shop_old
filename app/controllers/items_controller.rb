class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Item has been created.'
      redirect_to @item
    else
      flash.now[:alert] = 'Item has not been created.'
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The item could not be found.'
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :unit_price, :url, :note)
  end

end
