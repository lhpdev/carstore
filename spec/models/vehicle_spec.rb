require 'spec_helper'

RSpec.describe Vehicle, type: :model do
  describe 'validations' do
    subject { build(:vehicle) }

    before do
      subject.validate
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    context 'with blank attributes' do
      subject do
        build(:vehicle, color: '', size: '', mileage: nil, price: '')
      end

      it 'must have a color' do
        expect(subject.errors[:color].size).to eq(1)
      end

      it 'must have a size' do
        expect(subject.errors[:size].size).to eq(1)
      end

      it 'must have a mileage' do
        expect(subject.errors[:size].size).to eq(1)
      end

      it 'must have a price' do
        expect(subject.errors[:size].size).to eq(1)
      end
    end
  end

  describe 'after create' do
    context 'with state within city' do
      subject do
        create(:vehicle, city: 'Savannah- GA', state: nil)
      end

      it 'must set state correctly after create' do
        expect(subject.city).to eq('Savannah')
        expect(subject.state).to eq('GA')
      end
    end
  end

  describe 'colors' do
    let(:all_colors) { ["Orange", "Yellow", "Green", "Red", "Gold", "Gray", "Blue", "Silver", "Maroon", "White", "Brown", "Black", "Tan", "Other"] }

    it 'retuns all colors correctly' do
      expect(Vehicle.colors).to eq(all_colors)
    end
  end

  describe 'sizes' do
    let(:all_sizes) { ["Convertible", "Crossover Utility Vehicle", "Sedan", "Pickup", "Minivan", "Wagon", "Coupe", "Van", "Wagon / Hatchback", "Suv"] }

    it 'retuns all sizes correctly' do
      expect(Vehicle.sizes).to eq(all_sizes)
    end
  end
end
