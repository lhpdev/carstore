module Vehicles
  class Search
    include Interactor

    delegate :search_params,
             to: :context

    def call
      context.vehicles = search_vehicles
      context.total_count = search_vehicles.count
    end

    private

    def search_vehicles
      @vehicles = search_by_color
      @vehicles = search_by_size
      @vehicles = search_by_mileage
      @vehicles = search_by_price
      @vehicles&.order('year')
    end

    def search_by_color
      @vehicles = Vehicle.where(color: search_params[:color]) if search_params[:color].present?
      @vehicles
    end

    def search_by_size
      @vehicles = @vehicles.where(size: search_params[:size]) if @vehicles && search_params[:size].present?
      @vehicles = Vehicle.where(size: search_params[:size]) if @vehicles.nil? && search_params[:size].present?
      @vehicles
    end

    def search_by_mileage
      if @vehicles
        @vehicles.where('mileage BETWEEN ? AND ?', search_params[:min_mileage], search_params[:max_mileage]) if search_params[:min_mileage].present? && search_params[:max_mileage].present?
        @vehicles.where('mileage >= ?', search_params[:min_mileage]) if search_params[:min_mileage].present? && search_params[:max_mileage].nil?
        @vehicles.where('mileage <= ?', search_params[:max_mileage]) if search_params[:max_mileage].present? && search_params[:min_mileage].nil?
        @vehicles
      else
        @vehicles = Vehicle.where('mileage BETWEEN ? AND ?', search_params[:min_mileage], search_params[:max_mileage]) if search_params[:min_mileage].present? && search_params[:max_mileage].present?
        @vehicles = Vehicle.where('mileage >= ?', search_params[:min_mileage]) if search_params[:min_mileage].present? && search_params[:max_mileage].nil?
        @vehicles = Vehicle.where('mileage <= ?', search_params[:max_mileage]) if search_params[:max_mileage].present? && search_params[:min_mileage].nil?
        @vehicles
      end
    end

    def search_by_price
      if @vehicles
        @vehicles.where('price BETWEEN ? AND ?', search_params[:min_price], search_params[:max_price]) if search_params[:min_price].present? && search_params[:max_price].present?
        @vehicles.where('price >= ?', search_params[:min_price]) if search_params[:min_price].present? && search_params[:max_price].nil?
        @vehicles.where('price <= ?', search_params[:max_price]) if search_params[:max_price].present? && search_params[:min_price].nil?
        @vehicles
      else
        @vehicles = Vehicle.where('price BETWEEN ? AND ?', search_params[:min_price], search_params[:max_price]) if search_params[:min_price].present? && search_params[:max_price].present?
        @vehicles = Vehicle.where('price >= ?', search_params[:min_price]) if search_params[:min_price].present? && search_params[:max_price].nil?
        @vehicles = Vehicle.where('price <= ?', search_params[:max_price]) if search_params[:max_price].present? && search_params[:min_price].nil?
        @vehicles
      end
    end
  end
end
