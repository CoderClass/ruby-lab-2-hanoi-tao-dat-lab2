Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  get 'sessions/new'
  post 'sessions/create', as: :submit_login
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
