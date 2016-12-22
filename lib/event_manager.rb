
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


                # #A second way to solve this problem is to track the index of the current line.
                # lines = File.readlines "event_attendees.csv"
                #   row_index = 0
                #   lines.each do |line|
                #     row_index = row_index + 1
                #     next if row_index == 1
                #     columns = line.split(",")
                #     name = columns[2]
                #     puts name
                #   end

# Switching over to use the CSV Library #
# Acessing Columns by their Names #
require "csv"
puts "EventManager Initialized!"
#able to output the individual and zipcode
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  # if the zip code is exactly five digits. assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
  if zipcode.nil?
    zipcode = "00000"
  elsif zipcode.length < 5
    zipcode = zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
end

puts "#{name} #{zipcode}"
end
