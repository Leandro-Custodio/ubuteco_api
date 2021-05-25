# frozen_string_literal: true

module Api
  class V1::OrdersController < ApplicationController
    load_and_authorize_resource

    def index
      @orders = paginate @orders
    end

    def show; end

    def search
      @orders = Order.search params[:q]
      @orders = paginate @orders
    end

    def create
      @order = Order.new(create_params)

      if @order.save
        render status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def update
      unless @order.update(update_params)
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
    end

    private

    def create_params
      params.permit(:total,
                    :total_with_discount,
                    :status,
                    :discount,
                    :user,
                    :user_id,
                    :organization,
                    :organization_id,
                    :table_id)
    end

    def update_params
      params.permit(:total,
                    :total_with_discount,
                    :status,
                    :discount,
                    :user,
                    :user_id,
                    :table_id)
    end
  end
end
