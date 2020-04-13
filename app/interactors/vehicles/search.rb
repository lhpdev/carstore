module Vehicles
  class Search
    include Interactor

    delegate :search_params,
             to: :context

    def call
      context.vehicles = search_vehicles
      context.total_count = search_vehicles&.count
    end

    private

    def search_vehicles
      @vehicles = Vehicle.all
      @vehicles = @vehicles.where(color: search_params[:color]) if search_params[:color].present?
      @vehicles = @vehicles.where(size: search_params[:size]) if search_params[:size].present?
      @vehicles = search_by_mileage if search_params[:min_mileage].present? || search_params[:max_mileage].present?
      @vehicles = search_by_price if search_params[:min_price].present? || search_params[:max_price].present?
      @vehicles&.order('year')
    end

    def search_by_mileage
      if search_params[:min_mileage].present? && search_params[:max_mileage].present?
        @vehicles.where('mileage BETWEEN ? AND ?', search_params[:min_mileage], search_params[:max_mileage])
      elsif search_params[:min_mileage].present? && search_params[:max_mileage].nil?
        @vehicles.where('mileage >= ?', search_params[:min_mileage])
      elsif search_params[:min_mileage].nil? && search_params[:max_mileage].present?
        @vehicles.where('mileage <= ?', search_params[:max_mileage])
      end
    end

    def search_by_price
      if search_params[:min_price].present? && search_params[:max_price].present?
        @vehicles.where('price BETWEEN ? AND ?', search_params[:min_price], search_params[:max_price])
      elsif search_params[:min_price].present? && search_params[:max_price].nil?
        @vehicles.where('price >= ?', search_params[:min_price])
      elsif search_params[:min_price].nil? && search_params[:max_price].present?
        @vehicles.where('price <= ?', search_params[:max_price])
      end
    end
  end
end
