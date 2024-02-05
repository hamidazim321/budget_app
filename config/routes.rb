Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  get "up" => "rails/health#show", as: :rails_health_check

end
