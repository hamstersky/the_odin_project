require 'csv'
require 'erb'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]  
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(number)
  number.gsub!(/\D/, '')
  if number.length > 11 && number[0] == 1
    number[0] = ''
    number
  elsif number.length == 10
    number
  end
end

def get_date(date)
  DateTime.strptime(date, '%m/%d/%y %H:%M')
end

def show_sorted_frequencies(hash)
  sorted_hash = sort_frequencies(hash)
  sorted_hash.each do |item, count|
    puts "#{item}: #{count} times"
  end
end

def sort_frequencies(hash)
  hash.sort_by { |item, count| count }.reverse
end


puts "EventManager Initialized!"

contents = CSV.open "../event_attendees.csv", headers: true,
                                              header_converters: :symbol
template_letter = File.read("../form_letter.erb")
erb_template = ERB.new(template_letter)

hours = Hash.new(0)
days = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  date = row[:regdate]
  hours[get_date(date).hour] += 1
  days[Date::DAYNAMES[get_date(date).wday]] += 1

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)
end

show_sorted_frequencies(hours)
show_sorted_frequencies(days)