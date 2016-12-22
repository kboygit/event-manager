
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

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

  legislator_names = legislators.collect do |legislator|
    "#{legislator.first_name} #{legislator.last_name}"
  end

  legislator_names.join(", ")
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.html"

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode).join(", ")

  # personal_letter = template_letter.gsub('FIRST_NAME',name)
  # personal_letter.gsub!('LEGISLATORS',legislators)
  personal_letter = template_letter.gsub('FIRST_NAME',name)
  personal_letter = personal_letter.gsub('LEGISLATORS',legislators)


  puts personal_letter
end
