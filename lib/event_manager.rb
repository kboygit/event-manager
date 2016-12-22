
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

# Switching over to use the CSV Library# 
require "csv"
puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
  name = row[2]
  puts name
end
