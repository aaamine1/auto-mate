desc "delete of last vending machine"
task destroy_last_vm: :environment do
  VendingMachine.last.destroy
end
