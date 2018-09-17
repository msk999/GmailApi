Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      post :auth, to: "authentication#create"
      resources :messages 
      resources :labels
      resources :users
    end 
  end

end
