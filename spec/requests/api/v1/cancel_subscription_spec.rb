

# it 'renders an error message if subscription is already active' do
#     mufasa = Customer.create(first_name: "Mufasa", last_name: "Skar", email: "mufasa@lionking.com", address: "In the jungle, the Mighty Jungle")
#     simba = Customer.create(first_name: "Simba", last_name: "Mufasa", email: "simba@lionking.com", address: "In the jungle, the Mighty Jungle")
#     peach = Tea.create(title: "country_peach", description: "peachy!", temperature: "hot", brew_time: "enough")
#     lemon_loaf = Tea.create(title: "lemon_loaf", description: "zesty cake!", temperature: "hot", brew_time: "enough")
#     lemon_subscription = Subscription.create(customer_id: mufasa.id, tea_id: peach.id, price: "$4.99", frequency: "Monthly", status: "active")


#     json_payload = { "email": "mufasa@lionking.com",
#                      "tea_id": peach.id,
#                      "price": "$4.99",
#                      "frequency": "Monthly"
#                     }

#     expect(Subscription.all.length).to eq(0)

#     post '/api/v1/subscriptions', :headers => {"Content-Type" => "application/json", Accept: "application/json"}, params: json_payload.to_json

#     expect(response).to be_successful
#     parsed_response = JSON.parse(response.body,symbolize_names: true)
    
#     expect(parsed_response).to eq({Error: "This email is already in use. Please use another one."})
#   end