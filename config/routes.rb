Rails.application.routes.draw do
  #resources :tasks
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  #resources :lists

  resources :lists do
    resources :tasks
  end

  root to: "lists#index"

  #match "*path" => redirect("/"), :via => [:get, :post, :delete]
end
