Rails.application.routes.draw do
  get 'refresh/create'
  # get 'login/create'
  # get 'signup/create'
  namespace :api do
    namespace :v1 do
      resources :characters
      resources :users
      resources :game
    end
  end

  post 'login', controller: :login, action: :create
  post 'refresh', controller: :refresh, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'login', controller: :login, action: :destroy

  # root 'game#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
