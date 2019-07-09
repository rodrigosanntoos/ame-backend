class Api::V1::UsersController < ApplicationController
    before_action :authenticate_api_v1_admin!
    before_action :set_user, only: [:update, :destroy, :show]

    def create
        @user = User.new user_params
        if !@user.save
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def index
        params[:page] ||= 1
        @users = User.all.page(params[:page]).per(10)
    end
    
    def index_sale
        @users = User.all
        render json: @users
    end

    def update
        if !@user.update!(user_params) 
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user.delete
    end

    private

    def user_params
        params.permit(:id, :name, :address, :number, :telephone, :cell_phone, :complement)
    end

    def set_user
        @user = User.find(params[:id])
    end


end
