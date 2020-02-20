Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  resources :lists

  root to: "home#index"

  match "*path" => redirect("/"), :via => [:get, :post]
end
