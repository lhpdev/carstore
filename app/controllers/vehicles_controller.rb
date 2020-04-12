class VehiclesController < ApplicationController
  include Errors

  def index
    if @errors.empty?
      result = Vehicles::Search.call(search_params: search_params)

      if result.success? && result.vehicles.present?
        @total_count = result.total_count
        @vehicles = Kaminari.paginate_array(result.vehicles).page(params[:page])
      else
        @vehicles = nil
      end
    else
      @vehicles = nil
    end
  end

  private

  def search_params
    search_filters = {}
    search_filters[:color] = params[:color] if params[:color].present?
    search_filters[:size] = params[:size] if params[:size].present?
    search_filters[:min_mileage] = params[:min_mileage] if params[:min_mileage].present?
    search_filters[:max_mileage] = params[:max_mileage] if params[:max_mileage].present?
    search_filters[:min_price] = params[:min_price] if params[:min_price].present?
    search_filters[:max_price] = params[:max_price] if params[:max_price].present?
    search_filters
  end
end
