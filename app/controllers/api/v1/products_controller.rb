class Api::V1::ProductsController < ApplicationController

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

    private

    def product_params
        params.permit(:id, :name, :amount, :value_product, :value_unit, :value_smash)
    end

end
