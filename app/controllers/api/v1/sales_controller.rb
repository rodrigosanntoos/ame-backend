class Api::V1::SalesController < ApplicationController
    before_action :set_sale, only: [:update, :destroy, :show]

    def create
        @sale = Sale.new sale_params
        if !@sale.save
            render json: @sale.errors, status: :unprocessable_entity
        end
    end

    def index
        params[:page] ||= 1
        @sales = Sale.all.page(params[:page]).per(10)
    end

    def update
        if !@sale.save!(sale_params) 
            render json: @sale.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @sale.delete
    end

    private

    def sale_params
        params.permit(:id, :user_id, :address, :number, :apt, :complement, :reference, :phone, :cell_phone, :birthday_name, :year, :number_children, :age_range, :amount_adult, :hour, :date_event, :day_week, :date_final, :freight, :days_collect, :value_final)
    end

    def set_sale
        @sale = Sale.find(params[:id])
    end   

end
