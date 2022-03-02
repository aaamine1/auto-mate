class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dahsboard_vendor
    @vending_machines = VendingMachines.all 
    @vending_machine = @vending_machines.find(params[:id])

    @products = Products.all
    @product = @products.find(params[vending_machine_id])
  end 
end
