Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  resources :groups
  get "up" => "rails/health#show", as: :rails_health_check

end
