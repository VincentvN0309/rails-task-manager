Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "tasks#index"

  get "/tasks", to: "tasks#index" # List all tasks
  get "/tasks/new", to: "tasks#new" # Form to create a new task
  post "/tasks", to: "tasks#create" # Create a new task
  get "/tasks/:id", to: "tasks#show", as: :task # View a single tasks
  get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task # Form to edit a task
  patch "/tasks/:id", to: "tasks#update" # Update a task
  delete "/tasks/:id", to: "tasks#destroy" # Delete a task
  patch "/tasks/:id/toggle_completed", to: "tasks#toggle_completed", as: :toggle_completed_task
end
