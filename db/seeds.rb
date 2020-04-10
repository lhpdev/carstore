require 'csv'

https://itnext.io/how-to-seed-a-rails-database-with-a-csv-file-105a7ba0e88c

CSV.foreach(Rails.root.join('lib/csvs/vehicles_list_1.csv'), headers: true) do |row|
  Vehicle.create({
    year: row[0],
    make: row[1],
    model: row[2],
    model_series: row[3],
    color: row[4],
    mileage: row[8],
    price: row[9],
    city: row[12],
    state: row[13]
  })
end

CSV.foreach(Rails.root.join('lib/csvs/vehicles_list_2.csv'), headers: true) do |row|
  Vehicle.create({
    year: row[6],
    make: row[3],
    model: row[4],
    model_series: row[5],
    color: row[11],
    mileage: row[13],
    price: row[7],
    city: row[17],
  })
end
