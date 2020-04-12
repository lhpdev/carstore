module Errors
  extend ActiveSupport::Concern

  included do
    before_action :find_errors?
  end

  def find_errors?
    @errors = {}

    if params[:min_price].present? && params[:max_price].present?
      @errors[:price] = 'Min Price can not be higher than Max Price' unless params[:min_price] <= params[:max_price]
    end

    if params[:min_mileage].present? && params[:max_mileage].present?
      @errors[:mileage] = 'Min Mileage can not be higher than Max Mileage' unless params[:min_mileage] <= params[:max_mileage]
    end
    puts 'Errors:'
    puts @errors
    @errors
  end
end
