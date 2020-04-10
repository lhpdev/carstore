class Vehicle < ApplicationRecord
  after_create :update_city_and_state!, if: :update_city_and_state?

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
