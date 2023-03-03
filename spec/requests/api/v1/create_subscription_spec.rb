require 'rails_helper'

RSpec.describe 'Create Subscription', :type => :request do 
    it 'creates a new subscription based on a json payload body then renders a json response with a success message' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
        simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
        peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
        lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")


        json_payload = { "email": "mufasa@lionking.com",
                         "tea_id": peach.id,
                         "price": "$4.99",
                         "frequency": "Monthly"
                        }
    
        expect(Subscription.all.length).to eq(0)
    
        post '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json
        
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body,symbolize_names: true)
    
        expect(Subscription.all.length).to eq(1)
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:success])
        expect(parsed_response[:success]).to eq("Subscription created successfully")
    end

    it 'creates a new subscription based on a json payload body then renders a json response with a success message' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
        simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
        peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
        lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")


        json_payload = { "email": "mufasa@lionking.com",
                         "tea_id": peach.id,
                         "price": "$4.99",
                         "frequency": "Monthly"
                        }
    
        expect(Subscription.all.length).to eq(0)
    
        post '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json
        
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body,symbolize_names: true)
    
        expect(Subscription.all.length).to eq(1)
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:success])
        expect(parsed_response[:success]).to eq("Subscription created successfully")
    end

    it 'returns an error if email is not found/not provided or tea is not found' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
        simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
        peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
        lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")


        json_payload = { "email": "mostafa@lionking.com",
                         "tea_id": peach.id,
                         "price": "$4.99",
                         "frequency": "Monthly"
                        }
    
        expect(Subscription.all.length).to eq(0)
    
        post '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json
        
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body,symbolize_names: true)
    
        expect(Subscription.all.length).to eq(0)
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:error])
        expect(parsed_response[:error]).to eq("Woopsies! User email or tea id are either missing or incorrect!")
    end
end