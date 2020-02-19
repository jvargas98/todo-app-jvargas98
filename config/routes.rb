Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_scope :user do
    get "login", to: "devise/sessions#new"
  end

  match "*path" => redirect("/"), :via => [:get, :post]
end
