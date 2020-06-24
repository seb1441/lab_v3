Rails.application.routes.draw do
  resources :boxes
  resources :notes
  devise_for :users
  root 'pages#home'
  get "/reminders" => "pages#reminders", as: "pages_reminders"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
