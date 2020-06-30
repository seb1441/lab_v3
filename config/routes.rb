Rails.application.routes.draw do
  resources :boxes
  resources :notes
  resources :box_categories, only: [:create, :destroy, :update]
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'pages#home'
  get "/reminders" => "pages#reminders", as: "pages_reminders"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
