Rails.application.routes.draw do
  get "dietas/index"
  get "dietas/show"
  get "dietas/new"
  get "dietas/create"
  get "dietas/edit"
  get "dietas/update"
  get "dietas/destroy"
  devise_for :users
  resources :dietas

  root "dietas#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
