class SubscriptionsSerializer 
    include JSONAPI::Serializer
  
    attributes :title, :price, :frequency, :status
end 