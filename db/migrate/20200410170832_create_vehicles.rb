class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :model_series
      t.string :color
      t.integer :mileage
      t.integer :price
      t.string :city
      t.string :state
    end
  end
end
