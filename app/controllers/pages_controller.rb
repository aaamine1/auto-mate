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
    # @vendor_vending_machines = VendingMachine.where(user_id: current_user)
    # @my_bookings = Booking.where(vending_machine_id: vending_machine_id)
    # @my_bookings = Booking.all.select do |booking|
    #   booking.user_id == current_user.id
    # end

    # VendingMachine.all.each do |machine|
    #   @total_quantity = 0
    #   machine.Item.all.each do |item|
    #     @total_quantity += item.quantity
    #   end
    # end

    # @total_capacity = 0
    # Item.all.each do |item|
    #   @total_capacity += item.capacity
    # end

    @vending_machines = VendingMachine.all
    # @total_sum = @vending_machines.map do |machine|
    #   items = Item.where(vending_machine_id: machine.id)
    #     quantity_items = items.map do |item|
    #       item.quantity
    #     end
    #   quantity_items.sum
    # end
    # # total_quantity += item.quantity

    # @vending_machines = VendingMachine.where(@total_sum < 150)
    @vm_number = @vending_machines.count
    @products = Product.all
  end
end
