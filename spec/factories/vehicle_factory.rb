FactoryBot.define do
  factory :vehicle do
    sequence(:year) { |n| "200#{n}" }
    make { 'Jeep' }
    model { 'Grand cherokee' }
    model_series { 'Limited' }
    color { 'Red' }
    size { 'Suv' }
    mileage { 40000 }
    price { 21800 }
    city { 'Savannah' }
    state { 'GA' }
  end
end
