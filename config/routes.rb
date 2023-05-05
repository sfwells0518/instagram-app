Rails.application.routes.draw do
  # Sign Up Routes (users)

  get "/signup" => "users#new"
  post "/users" => "users#create"

  # Login Routes (sessions)

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  # Profile routes

  # get "/profiles" => "profiles#index"
  get "/profiles" => "profiles#show"
  
  get "/profiles/new" => "profiles#new"
  post "/profiles" => "profiles#create"
  
  get "/profiles/edit" => "profiles#edit", as: "edit_profile"

  patch "/profiles" => "profiles#update"

end
