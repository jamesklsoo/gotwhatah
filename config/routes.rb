Rails.application.routes.draw do
  resources :votes
  resources :comments
  resources :events
  resources :locations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
