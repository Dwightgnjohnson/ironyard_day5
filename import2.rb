#require the data file
require './shipment'

 #initialize the shipments array - outside of the open block below to make it accessible.
shipments = []

#initalize money counter as well as each bonuses for the pilots
money = 0

fry_bonus = 0
fry_shipments = 0

amy_bonus = 0
amy_shipments = 0

bender_bonus = 0
bender_shipments = 0

leela_bonus = 0
leela_shipments = 0

open("planet_express_logs.csv").each do |shipment_line|
#Break down the data into indivdual line-arrays, cut off the \n with 'chomp', while at the same time splitting the line up at the ','
  line_array = shipment_line.chomp.split(',')

#create a new instance of the Shipment class
  each_shipment = Shipment.new
#tell the each_shipment
  each_shipment.destination       = line_array[0]
  each_shipment.what_got_shipped  = line_array[1]
  each_shipment.how_many          = line_array[2].to_i
  each_shipment.money             = line_array[3].to_i

  shipments << each_shipment

#add money attribute to itself to the above counter
  money += each_shipment.money

# bonuses calculated:
  case each_shipment.destination
  when "Earth"
    fry_bonus     += each_shipment.money * 0.10
    fry_shipments += 1
  when "Mars"
    amy_bonus     += each_shipment.money * 0.10
    amy_shipments += 1
  when "Uranus"
    bender_bonus  += each_shipment.money * 0.10
    bender_shipments += 1
  else
    leela_bonus   += each_shipment.money * 0.10
    leela_shipments += 1
  end

end






# How many trips did each employee pilot?
total_number_of_trips = fry_shipments + amy_shipments + bender_shipments + leela_shipments
puts "\n$ WE MADE"
puts "We made $#{money} in this week's shipments"
puts "\nIn total, #{total_number_of_trips} shipments were made:"
puts "Fry made #{fry_shipments} trips to Earth, Amy only made #{amy_shipments} to Mars, Bender made a surprising #{bender_shipments} to Uranus (mostly for the jokes) and thankfully Leela picked up the slack and made a total of #{leela_shipments}."

# How much of a bonus did each employee get?
puts "\nBONUSES"
puts "With Amy only making #{amy_shipments} trip to Mars, she only received a bonus of $#{amy_bonus.to_i}. Fry and Bender did a little better; Fry: $#{fry_bonus.to_i} & Bender: $#{bender_bonus.to_i}. Leela did the best with #{leela_shipments} shipments, making a total bonus of $#{leela_bonus.to_i}."

# How much money did we make broken down by planet?
# puts "\nMONEY BY PLANET"
# # puts "#{shipments}"




#end
