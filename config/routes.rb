Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
      resources :products
    end
  end
end
