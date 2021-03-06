Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, controller: "users" do
    resources :votes, controller: "votes"
    resources :events, controller: "events"
    resources :comments, controller: "comments"
  end

  resources :events, controller: "events" do
    resources :comments, controller: "comments", only: [:create, :new, :update, :destroy]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root 'welcome#index'

  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
    member do
      put "like", to: "events#upvote"
      put "dislike", to: "events#downvote"
    end
  end

  root 'welcome#index'

end
