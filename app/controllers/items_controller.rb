class ItemsController < ApplicationController
  def new
    @item = Item.new
    @vending_machine = VendingMachine.find(params[:vending_machine_id])
  end

  def create
    @item = Item.new(item_params)
    @vending_machine = VendingMachine.find(params[:vending_machine_id])
    @item.vending_machine = @vending_machine
    if @item.save
      redirect_to vending_machine_path(@vending_machine), notice: "Your product was successfully added!"
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @vending_machine = @item.vending_machine
    @item.destroy
    redirect_to vending_machine_path(@vending_machine)
  end

  private

  def item_params
    params.require(:item).permit(:list_price, :margin, :capacity, :vending_machine_id, :product_id, :quantity)
  end


end
