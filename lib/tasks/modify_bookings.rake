desc "modify bookings"
task modify_bookings: :environment do
  this_week = []
  (0..6).each  do |i|
    this_week.push(Date.today - i.day)
  end
  p this_week
  Booking.all.each do |booking|
    if booking.status == "completed"
      booking.update(created_at: this_week[rand(6)])
    end
  end
end
