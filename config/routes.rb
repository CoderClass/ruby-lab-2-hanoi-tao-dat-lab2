Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'sessions/create', as: :submit_login
  delete 'sessions/destroy', as: :logout
  delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
