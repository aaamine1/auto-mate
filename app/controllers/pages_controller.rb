class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dahsboard_vendor
    @vending_machines = VendingMachine.all do |vending_machine|
      user_vending_machines = vending_machine.user_id == current_user.id
      user_vending_machines.find(params[:id])
    end 

    @products = Product.all
    @product = @products.find(params[vending_machine_id])
  end 


  def dashboard_refiller

    @my_bookings = Booking.where(user_id: [User.pluck(:id)]).where('id > ?', 9)
    # @my_bookings = Booking.all.select do |booking|
    #   booking.user_id == current_user.id
    # end 

    @vending_machines =VendingMachine.all
  end
end 
