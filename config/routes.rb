Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "lists#index"
  resources :lists, only: [:index, :show, :create, :new, :destroy] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: :destroy
end
