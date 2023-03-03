class Api::V1::SubscriptionsController < ApplicationController
    def index
    end

    def create
        if Customer.find_by(email: params[:email]) && Tea.find(params[:tea_id])
            customer = Customer.find_by(email: params[:email])
            tea = Tea.find(params[:tea_id])
            customer.subscriptions.create(tea_id: tea.id, price: params[:price], frequency: params[:frequency], status: "active")
            render json: { "success": "Subscription created successfully"}, status: 201
        else
            render json: {error: "Woopsies! User email or tea id are either missing or incorrect!"}
        end
    end

    def update
    end
end