require 'csv'

puts 'Importing Vehicles from CSV File 2 ...'
CSV.foreach(Rails.root.join('lib/csvs/vehicles_list_2.csv'), headers: true) do |row|
  puts '.' if $. % 200 == 0
  Vehicle.create({
    year: row[6],
    make: row[3].humanize,
    model: row[4].humanize,
    model_series: row[5],
    color: row[11],
    size: row[8],
    mileage: row[13],
    price: row[7],
    city: row[17]
  })
end
puts 'Done'
