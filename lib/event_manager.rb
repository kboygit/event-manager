puts "EventManager Initialized!"

# ---- Another way of reading in as an array of lines ---- #
# contents = File.read "event_attendees.csv"
# puts contents


# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   columns = line.split(".")
#   puts columns
# end

# #Accessing the arrays in each elements
# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   columns = line.split(".")
#   name = columns[2]
#   puts name
# end

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
  columns = line.split(",")
  name = columns[2]
  puts name
end
