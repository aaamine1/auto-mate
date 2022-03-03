class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @vending_machine = VendingMachine.find(params[:id])
    end

    def create
        @booking = Booking.new
        @vending_machine = VendingMachine.find(params[:id])
        @booking.vending_machine = @vending_machine
        @booking.user = current_user
        # raise
        if @booking.save
            # redirect_to venue_booking_path(@venue, @booking)
            redirect_to vending_machine_path(@vending_machine), notice: "Booking successful! Tik Tok Tik Tok, time is running out"
        else
            render :new
        end
    end
end
