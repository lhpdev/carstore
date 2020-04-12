class Vehicle < ApplicationRecord
  after_create :update_city_and_state!, if: :update_city_and_state?

  validates :color, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :mileage, presence: true

  def self.colors
    ["Orange", "Yellow", "Green", "Red", "Gold", "Gray", "Blue", "Silver", "Maroon", "White", "Brown", "Black", "Tan", "Other"]
  end

  def self.sizes
    ["Convertible", "Crossover Utility Vehicle", "Sedan", "Pickup", "Minivan", "Wagon", "Coupe", "Van", "Wagon / Hatchback", "Suv"]
  end

  protected

  def update_city_and_state?
    city.present? && state.nil?
  end

  private

  def update_city_and_state!
    self.state = city.partition('- ').last
    self.city = city.slice(0..(city.index('-'))-1)
    self.save
  end
end
