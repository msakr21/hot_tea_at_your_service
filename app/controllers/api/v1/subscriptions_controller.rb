class Api::V1::SubscriptionsController < ApplicationController
    def index
    end

    def create
        if Customer.find_by(email: params[:email]) && Tea.find_by(id: params[:tea_id])
            customer = Customer.find_by(email: params[:email])
            tea = Tea.find(params[:tea_id])
            customer.subscriptions.create(tea_id: tea.id, price: params[:price], frequency: params[:frequency], status: "active")
            render json: { "success": "Subscription created successfully"}, status: 201
        else
            render json: {error: "Woopsies! User email or tea id are either missing or incorrect!"}
        end
    end

    def update
        if subscription = Subscription.find_by(id: params[:id])
            subscription.update(status: "cancelled")
            render json: { "Success": "This subscription is now cancelled"}, status: 201
        else
            render json: { "error": "No subscription with this id exists"}, status: 404
        end
    end
end