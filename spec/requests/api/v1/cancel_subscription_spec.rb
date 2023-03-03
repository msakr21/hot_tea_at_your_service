require 'rails_helper'

RSpec.describe 'Cancel Subscription', :type => :request do
    it 'Changes the status of a subscription to cancelled' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
        simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
        peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
        lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")
        lemon_subscription = Subscription.create(customer_id: mufasa.id, tea_id: peach.id, price: "$4.99", frequency: "Monthly", status: "active")


        json_payload = { id: lemon_subscription.id
                        }

        expect(Subscription.all.length).to eq(1)

        patch '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body,symbolize_names: true)
        
        expect(parsed_response).to eq({Success: "This subscription is now cancelled"})
    end

    it 'Barfs an error if subscription is not found' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
        simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
        peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
        lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")
        lemon_subscription = Subscription.create(customer_id: mufasa.id, tea_id: peach.id, price: "$4.99", frequency: "Monthly", status: "active")


        json_payload = { id: 2
                        }

        expect(Subscription.all.length).to eq(1)

        patch '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json

        expect(response.status).to eq(404)
        parsed_response = JSON.parse(response.body,symbolize_names: true)
        
        expect(parsed_response).to eq({error: "No subscription with this id exists"})
    end
end