class Api::V1::UsersController < ApplicationController

    def create
        @user = User.new user_params
        if @user.save
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def update
        if !@user.save!(user_params) 
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @user
    end

    def destroy
        @user.delete
    end

    private

    def user_params
        params.permit(:id, :name, :email, :address, :number, :apt, :neighborhood, :telephone, :cell_phone, :name_birthday, :number_childrem, :number_adult, :hour_start, :hour_end, :date, :day_week)
    end

end
