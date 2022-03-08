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
      @booking.update(status: 'completed')
      redirect_to dashboard_refiller_path, notice: "Booking complete !"
    end

    def decline
      @booking = Booking.find(params[:id])
      @booking.update(status: 'declined')
      redirect_to dashboard_refiller_path, notice: "Booking declined !"
    end
end
