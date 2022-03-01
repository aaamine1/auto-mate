class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @venue = Venue.find(params[:vending_machine_id])
    end

    def create
        @booking = Booking.new(booking_params)
        @vending_machine = VendingMachine.find(params[:vending_machine_id])
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

    private 

    def booking_params
        params.require(:booking).permit(:status, :start_date, :end_date, :venue_id)
    end
end
