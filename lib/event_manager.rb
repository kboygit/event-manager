
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

                      # Longer way of writing #
                      #
                      # def clean_zipcode(zipcode)
                      #   zipcode.to_s.rjust(5,"0")[0..4]
                      # end
                      #
                      # def clean_zipcode(zipcode)
                      #   if zipcode.nil?
                      #     zipcode = "00000"
                      #   elsif zipcode.length < 5
                      #      zipcode.to_s.rjust(5,"0")[0..4]
                      #   elsif zipcode.length > 5
                      #     zipcode = zipcode[0..4]
                      #   else
                      #     zipcode
                      # end
                      # end

# Switching over to use the CSV Library #
# Acessing Columns by their Names #
require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)
  puts form_letter
end
