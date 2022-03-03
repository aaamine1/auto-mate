class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dahsboard 

    @vendor_vending_machines = VendingMachine.where(user_id: current_user) 
    @my_bookings = Booking.where(vending_machine_id: vending_machine_id)
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

    total_quantity = 0
    VendingMachine.all.each do |machine|
      Item.where(vending_machine_id: machine.id).each do |item|
          # total_quantity += item.quantity 
        end 
      end
    end 

    


    
    @vending_machines = VendingMachine.where(@total_quantity < 150) 
  end
end 
