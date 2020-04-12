require 'spec_helper'

module Vehicles
  describe Search do
    subject { Search.call(search_params: search_params) }

    describe 'testing returned vehicles within result' do
      let(:vehicle) { create(:vehicle) }

      context 'with vehicle found' do
        context 'testing search by color' do
          let(:search_params) {
            {
              color: "Red"
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to include(vehicle)
          end
        end

        context 'testing search by size' do
          let(:search_params) {
            {
              size: "Suv"
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to include(vehicle)
          end
        end

        context 'testing search by mileage' do
          let(:search_params) {
            {
              min_mileage: 10000,
              max_mileage: 41000
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to include(vehicle)
          end
        end

        context 'testing search by price' do
          let(:search_params) {
            {
              min_price: 10000,
              max_price: 25000
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to include(vehicle)
          end
        end
      end

      context 'with vehicle not found' do
        context 'testing search by color' do
          let(:search_params) {
            {
              color: "Blue"
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to_not include(vehicle)
          end
        end

        context 'testing search by size' do
          let(:search_params) {
            {
              size: "Sedan"
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to_not include(vehicle)
          end
        end

        context 'testing search by mileage' do
          let(:search_params) {
            {
              min_mileage: 10000,
              max_mileage: 20000
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to_not include(vehicle)
          end
        end

        context 'testing search by price' do
          let(:search_params) {
            {
              min_price: 10000,
              max_price: 10000
            }
          }

          it 'returns correcly search result' do
            expect(subject.vehicles).to_not include(vehicle)
          end
        end
      end
    end
  end
end
