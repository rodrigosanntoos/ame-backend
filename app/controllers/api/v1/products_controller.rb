class Api::V1::ProductsController < ApplicationController
    # before_action :authenticate_api_v1_admin!
    before_action :set_product, only: [:update, :destroy, :show]

    def create
        @product = Product.new product_params
        if @product.save
            render json: @product
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def index
        @products = Product.all
        render json: @products
    end
    
    def update
        if !@product.save!(product_params) 
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @product
    end

    def destroy
        @product.delete
    end

    private

    def product_params
        params.permit(:id, :name, :amount, :value_product, :value_unit, :value_smash)
    end

    def set_product
        @product = Product.find(params[:id])
    end

end
