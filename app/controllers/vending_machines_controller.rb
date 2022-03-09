class VendingMachinesController < ApplicationController
    def index
        @vending_machines = VendingMachine.all
        @booking = Booking.new

        @markers = @vending_machines.geocoded.map do |vending_machine|
        {
            lat: vending_machine.latitude,
            lng: vending_machine.longitude,
            info_window: render_to_string(partial: "info_window", locals: { vending_machine: vending_machine })
        }
        end
    end

    def show
        @vending_machine = VendingMachine.find(params[:id])
        @item = Item.new
        @booking = Booking.new
    end

    def new
        @vending_machine = VendingMachine.new
    end

    def create
        @vending_machine = VendingMachine.new(vending_machine_params)
        @vending_machine.user = current_user
        if @vending_machine.save
          redirect_to vending_machine_path(@vending_machine)
        else
          render :new
        end
    end

    def edit
        @vending_machine = VendingMachine.find(params[:id])
    end

    def update
        @vending_machine = VendingMachine.find(params[:id])
        @vending_machine.update(vending_machine_params)
        redirect_to vending_machine_path(@vending_machine)
    end

    def destroy
        @vending_machine = VendingMachine.find(params[:id])
        @vending_machine.destroy
        redirect_to dashboard_vendor_path
    end

    private

    def vending_machine_params
        params.require(:vending_machine).permit(:address, :description, :id, :name)
    end
end
