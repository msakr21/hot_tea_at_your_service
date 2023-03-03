require 'rails_helper'

RSpec.describe 'Get Subscriptions', :type => :request do
    it 'returns a hash response that has a list of favorite recipe and information about each recipe' do
      mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
      simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
      peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
      lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")
      lemon_subscription = mufasa.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "active")
      lemon_subscription_2 = mufasa.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "cancelled")
      lemon_subscription_3 = simba.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "cancelled")
      peach_subscription = mufasa.subscriptions.create(tea_id: peach.id, title: peach.title, price: "$4.99", frequency: "Monthly", status: "active")
  
      get "/api/v1/subscriptions?email=mufasa@lionking.com"
  
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body,symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response.keys).to eq([:data])
      expect(parsed_response[:data]).to be_a(Array)
      expect(parsed_response[:data].length).to eq(3)
      expect(parsed_response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(parsed_response[:data].first[:attributes].keys).to eq([:title, :price, :frequency, :status])
      expect(parsed_response[:data].first[:attributes][:title]).to eq("lemon_loaf")
      expect(parsed_response[:data].first[:attributes][:price]).to eq("$4.99")
      expect(parsed_response[:data].first[:attributes][:frequency]).to eq("Monthly")
      expect(parsed_response[:data].first[:attributes][:status]).to eq("active")
    end

    it 'returns an error json response if no customer with that email exists' do
        mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
      simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
      peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
      lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")
      lemon_subscription = mufasa.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "active")
      lemon_subscription_2 = mufasa.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "cancelled")
      lemon_subscription_3 = simba.subscriptions.create(tea_id: lemon_loaf.id, title: lemon_loaf.title, price: "$4.99", frequency: "Monthly", status: "cancelled")
      peach_subscription = mufasa.subscriptions.create(tea_id: peach.id, title: peach.title, price: "$4.99", frequency: "Monthly", status: "active")
  
      get "/api/v1/subscriptions?email=mostafa@lionking.com"
  
      expect(response.status).to eq(404)
      parsed_response = JSON.parse(response.body,symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response.keys).to eq([:error])
      expect(parsed_response[:error]).to eq("Ummmm.... No such customer exists?")
    end
end