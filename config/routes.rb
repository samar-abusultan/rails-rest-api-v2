Rails.application.routes.draw do
  # when we will send to this route we will get authentication token
  namespace 'api' do
    namespace 'v1' do
      post 'user_token' => 'user_token#create'
      resources :articles
    end
  end
end
