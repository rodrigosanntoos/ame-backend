Rails.application.routes.draw do
  # mount_devise_token_auth_for 'Admin', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      # mount_devise_token_auth_for 'Admin', at: 'auth', skip: [:omniauth_callbacks, :registrations, :passwords], controllers: {
      #   sessions: 'api/v1/overrides/sessions'
      # }
      resources :users
      resources :products
      resources :sales
    end
  end
end
