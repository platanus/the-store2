Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :purchases, only: [:index, :create, :show]
      resources :items, only: [:index, :show]
    end
  end
  devise_for :users
  mount ImageUploader.derivation_endpoint => "/derivations/image"
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
