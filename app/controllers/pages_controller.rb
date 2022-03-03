class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end


  def dashboard_vendor
    @vending_machines = VendingMachine.where(user: current_user)
    @vm_number = @vending_machines.count
    @products = Product.all
  end


  def dashboard_refiller

    @my_bookings = Booking.where(user_id: [User.pluck(:id)]).where('id > ?', 9)
    # @my_bookings = Booking.all.select do |booking|
    #   booking.user_id == current_user.id
    # end 

    @vending_machines =VendingMachine.all
  end
end 

