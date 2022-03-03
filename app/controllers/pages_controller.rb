class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard_vendor
    @vending_machines = VendingMachine.where(user: current_user)
    @products = Product.all
  end
end
