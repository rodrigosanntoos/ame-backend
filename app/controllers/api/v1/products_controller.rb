class Api::V1::ProductsController < Api::V1::BaseController
    before_action :authenticate_api_v1_admin!
    before_action :set_product, only: [:update, :destroy, :show]

    def create
        @product = Product.new product_params
        if !@product.save
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def index
        params[:page] ||= 1
        @products = Product.all.page(params[:page]).per(10)
    end

    def index_app
        @products = Product.all
        render json: @products
    end
    
    def update
        if !@product.update!(product_params) 
            render json: @product.errors, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
        @product.delete
    end

    private

    def product_params
        params.permit(:id, :name, :amount, :value, :value_smash)
    end

    def set_product
        @product = Product.find(params[:id])
    end

end
