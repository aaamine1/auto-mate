class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard_vendor
    @vending_machines = VendingMachine.where(user: current_user)
    @vm_number = @vending_machines.count
    @products = Product.all
  end
end
