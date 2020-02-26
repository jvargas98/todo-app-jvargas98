Rails.application.routes.draw do
  #resources :tasks
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  #resources :lists

  resources :lists do
    resources :tasks do
      get "update_status", on: :member, as: :update_status
    end
  end

  get "profile", to: "users#index"
  get "profile/picture", to: "users#edit"
  resources :users, only: [:update]

  root to: "lists#index"

  #match "*path" => redirect("/"), :via => [:get, :post, :delete]
end
