module Api
  class RolesController < ApplicationController
    load_and_authorize_resource

    def index; end

    def show; end

    def create
      @role = Role.new(create_params)

      if @role.save
        render status: :created
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def update
      unless @role.update(update_params)
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
