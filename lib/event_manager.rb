puts "EventManager Initialized!"

# ---- Another way of reading in as an array of lines ---- #
# contents = File.read "event_attendees.csv"
# puts contents


lines = File.readlines "event_attendees.csv"
lines.each do |line|
  columns = line.split(".")
  puts columns
end
