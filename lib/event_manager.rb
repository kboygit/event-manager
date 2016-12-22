puts "EventManager Initialized!"

# ---- Another way of reading in as an array of lines ---- #
# contents = File.read "event_attendees.csv" #
# puts contents #


puts "EventManager initialized."

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  puts line
end
