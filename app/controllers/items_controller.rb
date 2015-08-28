class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.author = current_user

    if @item.save
      flash[:notice] = 'Item has been created.'
      redirect_to @item
    else
      flash.now[:alert] = 'Item has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @item.update(item_params)
      flash[:notice] = 'Item has been updated.'
      redirect_to @item
    else
      flash.now[:alert] = 'Item has not been updated.'
      render 'edit'
    end
  end

  def destroy

    @item.destroy

    flash[:notice] = 'Item has been deleted.'
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The item could not be found.'
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :unit_price, :url, :note, :shipment, :delivery)
  end

end
