 class BookingsController < ApplicationController


    def create
        @booking = Booking.new
        @vending_machine = VendingMachine.find(params[:vending_machine_id])
        @booking.vending_machine = @vending_machine
        @booking.user = current_user
        if @booking.save
            redirect_to vending_machine_path(@vending_machine), notice: "Booking successful! Tik Tok Tik Tok, time is running out"
        else
            render :new
        end
    end

    def mark_as_complete
      @booking = Booking.find(params[:id])
      @booking.update(status: 'completed')
      redirect_to dashboard_refiller_path
    end

    def mark_as_declined
      
    end
end
