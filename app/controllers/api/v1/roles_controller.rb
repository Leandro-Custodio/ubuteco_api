module Api
  class V1::RolesController < ApplicationController
    load_and_authorize_resource

    def index
      render json: @roles
    end

    def show
      render json: @roles
    end

    def create
      @role = Role.new(create_params)

      if @role.save
        render json: @role, status: :created
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def update
      if @role.update(update_params)
        render json: @role
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @role.destroy
    end

    private

    def create_params
      params.permit(:name)
    end

    def update_params
      params.permit(:id, :name)
    end
  end
end