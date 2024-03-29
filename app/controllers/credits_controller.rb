class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    @credit.author = current_user

    if @credit.save
      flash[:notice] = 'Credit has been created.'
      redirect_to credits_path
    else
      flash.now[:alert] = 'Credit has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      flash[:notice] = 'Credit has been updated.'
      redirect_to credits_url
    else
      flash.now[:alert] = 'Credit has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @credit.destroy

    flash[:notice] = 'Credit has been deleted.'
    redirect_to credits_path
  end

  private

  def set_credit
    @credit = Credit.find(params[:id])
  end


  def credit_params
    params.require(:credit).permit(:amount)
  end
end
