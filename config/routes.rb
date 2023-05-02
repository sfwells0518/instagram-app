Rails.application.routes.draw do
  # Sign Up Routes (users)

  get "/signup" => "users#new"
  post "/users" => "users#create"

  # Login Routes (sessions)

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  # Profile routes

  get "/profile" => "profiles#show"
  get "/profile/edit" => "profiles#edit"
  patch "/profile" => "profiles#update"

end
