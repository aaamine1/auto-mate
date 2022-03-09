 class BookingsController < ApplicationController

  def create
    @booking = Booking.new
    @vending_machine = VendingMachine.find(params[:vending_machine_id])
    @booking.vending_machine = @vending_machine
    @booking.user = current_user
    if @booking.save
        redirect_to dashboard_refiller_path(@vending_machine), notice: "Booking successful! Tik Tok Tik Tok, time is running out"
    else
        render :new
    end
  end

  def complete
    @booking = Booking.find(params[:id])
    # date_completed has been added for graph/analytics & demo purposes
    @booking.update(status: 'completed', date_completed: DateTime.now)

    # When booking is completed, the stock is updated
    @booking.vending_machine.items.each do |item|
      item.update(quantity: item.capacity)
    end

    redirect_to dashboard_refiller_path,  notice: "Booking completed!"
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'declined')

    redirect_to dashboard_refiller_path, notice: "Booking declined!"
  end
end
